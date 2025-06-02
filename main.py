from langchain.docstore.document import Document
from langchain.text_splitter import RecursiveCharacterTextSplitter
# from langchain_community.document_loaders import PyPDFLoader  # Commented out PDF loader
from langchain_community.document_loaders import TextLoader
from langchain_neo4j import Neo4jGraph
from dotenv import load_dotenv
import os
from langchain_groq import ChatGroq
from langchain_experimental.graph_transformers import LLMGraphTransformer
import re
load_dotenv()

url = os.getenv('NEO4J_URI')
username = os.getenv('NEO4J_USERNAME')
password = os.getenv('NEO4J_PASSWORD')

graph = Neo4jGraph(
    url=url,
    username=username,
    password=password,
)

# Try a different Groq model that might have better function calling support
llm = ChatGroq(
    model="llama-3.3-70b-versatile",  # Changed to a larger model
    temperature=0,
    max_tokens=4096,
    timeout=60,
    max_retries=3,
)

# file_path = "2404.16130v2.pdf"  # Commented out PDF file
file_path = 'output.txt'

# Use TextLoader for text files instead of PyPDFLoader
loader = TextLoader(file_path, encoding='utf-8')
documents = loader.load()

text_splitter = RecursiveCharacterTextSplitter(
    chunk_size=400,
    chunk_overlap=100
)
docs = text_splitter.split_documents(documents)

# Limit the number of documents for testing
# docs = docs[:5]  # Only process first 5 chunks for testing

print(f"Processing {len(docs)} document chunks")

# Configure transformer with stricter settings
llm_transformer = LLMGraphTransformer(
    llm=llm,
    allowed_nodes=["Person", "Organization", "Technology", "Concept"],
    allowed_relationships=["RELATED_TO", "USES", "MENTIONS"],
    strict_mode=True,
)

try:
    # Process one document at a time with error handling
    graph_documents = []
    for i, doc in enumerate(docs):
        try:
            print(f"Processing document {i + 1}/{len(docs)}")
            single_doc_graph = llm_transformer.convert_to_graph_documents([doc])
            graph_documents.extend(single_doc_graph)
            print(f"Successfully processed document {i + 1}")
        except Exception as e:
            print(f"Error processing document {i + 1}: {e}")
            continue

    print(f"Successfully processed {len(graph_documents)} documents total")
    if graph_documents:
        print("First graph document:", graph_documents[0])

except Exception as e:
    print(f"Fatal error: {e}")


# Function to sanitize strings for Cypher queries
def sanitize_for_cypher(text):
    """Sanitize text for use in Cypher queries."""
    if not text:
        return ""
    # Escape single quotes and backslashes
    text = str(text).replace("\\", "\\\\").replace("'", "\\'")
    # Remove or replace problematic characters
    text = re.sub(r'[^\w\s\-\.\,\:\;\!\?\(\)\[\]\/\@\#\$\%\^\&\*\+\=\<\>\~\`]', ' ', text)
    return text.strip()


# Function to generate Cypher CREATE statements
def generate_cypher_statements(graph_documents):
    """Generate Cypher CREATE statements from graph documents."""
    cypher_statements = []

    # Create indexes for better performance
    index_statements = [
        "CREATE INDEX IF NOT EXISTS FOR (n:Person) ON (n.id);",
        "CREATE INDEX IF NOT EXISTS FOR (n:Organization) ON (n.id);",
        "CREATE INDEX IF NOT EXISTS FOR (n:Technology) ON (n.id);",
        "CREATE INDEX IF NOT EXISTS FOR (n:Concept) ON (n.id);",
    ]
    cypher_statements.extend(index_statements)

    # Keep track of created nodes to avoid duplicates
    created_nodes = set()

    for graph_doc in graph_documents:
        # Process nodes
        for node in graph_doc.nodes:
            node_id = sanitize_for_cypher(node.id)
            node_type = sanitize_for_cypher(node.type)

            # Create a unique identifier for the node
            node_key = f"{node_type}:{node_id}"

            if node_key not in created_nodes:
                # Get node properties
                properties = []
                properties.append(f"id: '{node_id}'")

                # Add other properties if they exist
                if hasattr(node, 'properties') and node.properties:
                    for key, value in node.properties.items():
                        if key != 'id':  # Don't duplicate id
                            sanitized_value = sanitize_for_cypher(str(value))
                            properties.append(f"{key}: '{sanitized_value}'")

                properties_str = ", ".join(properties)

                cypher_statement = f"MERGE (n:{node_type} {{{properties_str}}});"
                cypher_statements.append(cypher_statement)
                created_nodes.add(node_key)

        # Process relationships
        for relationship in graph_doc.relationships:
            source_id = sanitize_for_cypher(relationship.source.id)
            source_type = sanitize_for_cypher(relationship.source.type)
            target_id = sanitize_for_cypher(relationship.target.id)
            target_type = sanitize_for_cypher(relationship.target.type)
            rel_type = sanitize_for_cypher(relationship.type)

            # Create relationship with properties if they exist
            rel_properties = []
            if hasattr(relationship, 'properties') and relationship.properties:
                for key, value in relationship.properties.items():
                    sanitized_value = sanitize_for_cypher(str(value))
                    rel_properties.append(f"{key}: '{sanitized_value}'")

            properties_str = ""
            if rel_properties:
                properties_str = f" {{{', '.join(rel_properties)}}}"

            cypher_statement = f"""
MATCH (source:{source_type} {{id: '{source_id}'}})
MATCH (target:{target_type} {{id: '{target_id}'}})
MERGE (source)-[r:{rel_type}{properties_str}]->(target);"""

            cypher_statements.append(cypher_statement)

    return cypher_statements


# Function to execute Cypher statements
def execute_cypher_statements(graph, statements, batch_size=100):
    """Execute Cypher statements in batches."""
    print(f"Executing {len(statements)} Cypher statements...")

    successful = 0
    failed = 0

    for i in range(0, len(statements), batch_size):
        batch = statements[i:i + batch_size]
        print(f"Processing batch {i // batch_size + 1}/{(len(statements) - 1) // batch_size + 1}")

        for statement in batch:
            try:
                graph.query(statement)
                successful += 1
            except Exception as e:
                print(f"Error executing statement: {statement[:100]}...")
                print(f"Error: {e}")
                failed += 1

    print(f"Execution complete. Successful: {successful}, Failed: {failed}")


# Function to save Cypher statements to file
def save_cypher_to_file(statements, filename="graph_data.cypher"):
    """Save Cypher statements to a file."""
    with open(filename, 'w', encoding='utf-8') as f:
        for statement in statements:
            f.write(statement + "\n\n")
    print(f"Cypher statements saved to {filename}")


# Main execution
if graph_documents:
    print("\nGenerating Cypher statements...")
    cypher_statements = generate_cypher_statements(graph_documents)

    print(f"Generated {len(cypher_statements)} Cypher statements")

    # Save to file for backup/review
    save_cypher_to_file(cypher_statements)

    # Display first few statements as examples
    print("\nFirst 5 Cypher statements:")
    for i, stmt in enumerate(cypher_statements[:5]):
        print(f"{i + 1}. {stmt}")

    # Ask user if they want to execute the statements
    user_input = input("\nDo you want to execute these statements in Neo4j? (y/n): ")

    if user_input.lower() in ['y', 'yes']:
        try:
            # Clear existing data (optional - uncomment if needed)
            # print("Clearing existing data...")
            # graph.query("MATCH (n) DETACH DELETE n;")

            # Execute the statements
            execute_cypher_statements(graph, cypher_statements)

            # Verify the data was loaded
            result = graph.query("MATCH (n) RETURN labels(n) as labels, count(n) as count")
            print("\nData loaded successfully! Node counts by label:")
            for record in result:
                print(f"  {record['labels']}: {record['count']}")

            # Show relationship counts
            rel_result = graph.query("MATCH ()-[r]->() RETURN type(r) as rel_type, count(r) as count")
            print("\nRelationship counts by type:")
            for record in rel_result:
                print(f"  {record['rel_type']}: {record['count']}")

        except Exception as e:
            print(f"Error executing Cypher statements: {e}")
    else:
        print("Cypher statements saved to file but not executed.")
        print("You can review the 'graph_data.cypher' file and execute it manually in Neo4j.")

else:
    print("No graph documents were generated. Please check your text file processing and LLM configuration.")