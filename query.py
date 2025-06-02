from langchain_neo4j import Neo4jGraph
from langchain_groq import ChatGroq
from dotenv import load_dotenv
import os

# Load environment variables
load_dotenv()

# Neo4j connection parameters
url = os.getenv('NEO4J_URI')
username = os.getenv('NEO4J_USERNAME')
password = os.getenv('NEO4J_PASSWORD')

# Initialize Neo4j graph connection
graph = Neo4jGraph(
    url=url,
    username=username,
    password=password,
)

# Initialize the language model
llm = ChatGroq(
    model="llama-3.3-70b-versatile",
    temperature=0,
    max_tokens=4096,
    timeout=60,
    max_retries=3,
)


def get_graph_schema():
    """Get the current graph schema."""
    try:
        return graph.get_schema
    except:
        # Fallback schema generation
        node_query = "CALL db.labels() YIELD label RETURN label"
        rel_query = "CALL db.relationshipTypes() YIELD relationshipType RETURN relationshipType"

        try:
            nodes = graph.query(node_query)
            relationships = graph.query(rel_query)

            schema = "Node Labels: " + ", ".join([n['label'] for n in nodes])
            schema += "\nRelationship Types: " + ", ".join([r['relationshipType'] for r in relationships])
            return schema
        except:
            return "Schema information not available"


def generate_cypher_query(question):
    """Generate a Cypher query from a natural language question."""
    schema = get_graph_schema()

    prompt = f"""You are a Neo4j Cypher query expert. 

Given this graph schema:
{schema}

Generate a Cypher query to answer this question: "{question}"

Rules:
1. Only use node labels and relationship types from the schema
2. Return only the Cypher query, no explanations
3. Use LIMIT 10 to limit results
4. For counting queries, use COUNT()
5. For listing queries, return relevant node properties

Examples:
- "What concepts are there?" → MATCH (n:Concept) RETURN n.id LIMIT 10
- "How many technologies?" → MATCH (n:Technology) RETURN COUNT(n)
- "What is related to X?" → MATCH (n)-[r]-(m) WHERE n.id CONTAINS 'X' RETURN n, r, m LIMIT 10

Cypher Query:"""

    try:
        response = llm.invoke(prompt)
        cypher_query = response.content.strip()

        # Clean up the response to extract just the Cypher
        lines = cypher_query.split('\n')
        for line in lines:
            line = line.strip()
            if line.upper().startswith(('MATCH', 'RETURN', 'WITH', 'CREATE', 'MERGE')):
                return line

        return cypher_query
    except Exception as e:
        print(f"Error generating Cypher: {e}")
        return None


def execute_cypher_query(cypher_query):
    """Execute a Cypher query and return results."""
    try:
        print(f"📊 Executing: {cypher_query}")
        result = graph.query(cypher_query)
        return result
    except Exception as e:
        print(f"❌ Query execution error: {e}")
        return None


def format_answer(question, cypher_query, results):
    """Generate a natural language answer from query results."""
    if not results:
        return "No results found for your query."

    # Limit results for the prompt
    limited_results = results[:5] if len(results) > 5 else results

    prompt = f"""Based on the question: "{question}"
And the Cypher query: {cypher_query}
And these results from Neo4j: {limited_results}

Provide a clear, natural language answer. If there are many results, summarize them.

Answer:"""

    try:
        response = llm.invoke(prompt)
        return response.content.strip()
    except Exception as e:
        print(f"Error formatting answer: {e}")
        return f"Found {len(results)} results: {limited_results}"


def query_graph(question):
    """Main function to query the graph with natural language."""
    print(f"\n🔍 Question: {question}")
    print("-" * 50)

    # Generate Cypher query
    cypher_query = generate_cypher_query(question)
    if not cypher_query:
        return None

    # Execute query
    results = execute_cypher_query(cypher_query)
    if results is None:
        return None

    # Format answer
    answer = format_answer(question, cypher_query, results)

    print(f"\n💡 Answer: {answer}")
    print(f"\n📊 Found {len(results)} total results")

    return {
        'question': question,
        'cypher_query': cypher_query,
        'results': results,
        'answer': answer
    }


def explore_graph():
    """Explore the graph structure."""
    print("\n🔍 Exploring Graph Structure...")
    print("=" * 50)

    queries = [
        ("Node counts", "MATCH (n) RETURN labels(n)[0] as label, count(n) as count ORDER BY count DESC"),
        ("Relationship counts", "MATCH ()-[r]->() RETURN type(r) as rel_type, count(r) as count ORDER BY count DESC"),
        ("Sample nodes", "MATCH (n) RETURN labels(n)[0] as label, n.id as id LIMIT 10")
    ]

    for title, query in queries:
        try:
            print(f"\n📊 {title}:")
            results = graph.query(query)
            for result in results:
                print(f"  {result}")
        except Exception as e:
            print(f"  Error: {e}")


def interactive_session():
    """Start an interactive query session."""
    print("\n💬 Interactive Query Session")
    print("=" * 50)
    print("Ask questions about your knowledge graph.")
    print("Commands: 'explore' (graph structure), 'quit' (exit)")
    print("-" * 50)

    while True:
        try:
            question = input("\n❓ Your question: ").strip()

            if question.lower() in ['quit', 'exit', 'q']:
                print("👋 Goodbye!")
                break
            elif question.lower() == 'explore':
                explore_graph()
            elif question:
                query_graph(question)
            else:
                print("Please enter a question.")

        except KeyboardInterrupt:
            print("\n👋 Session interrupted. Goodbye!")
            break
        except Exception as e:
            print(f"❌ Error: {e}")


def main():
    """Main function."""
    print("🔗 Simple Neo4j Knowledge Graph Query System")
    print("=" * 50)

    # Test connection
    try:
        test_result = graph.query("MATCH (n) RETURN count(n) as total_nodes LIMIT 1")
        total_nodes = test_result[0]['total_nodes'] if test_result else 0
        print(f"✅ Connected to Neo4j. Total nodes: {total_nodes}")

        if total_nodes == 0:
            print("⚠️  No nodes found. Make sure to load data first.")
            return

    except Exception as e:
        print(f"❌ Connection failed: {e}")
        return

    # Show schema
    print(f"\n📋 Graph Schema:")
    print(get_graph_schema())

    # Start interactive session
    interactive_session()


if __name__ == "__main__":
    main()