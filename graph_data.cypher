CREATE INDEX IF NOT EXISTS FOR (n:Person) ON (n.id);

CREATE INDEX IF NOT EXISTS FOR (n:Organization) ON (n.id);

CREATE INDEX IF NOT EXISTS FOR (n:Technology) ON (n.id);

CREATE INDEX IF NOT EXISTS FOR (n:Concept) ON (n.id);

MERGE (n:Person {id: 'Darren Edge'});

MERGE (n:Person {id: 'Ha Trinh'});

MERGE (n:Person {id: 'Newman Cheng'});

MERGE (n:Person {id: 'Joshua Bradley'});

MERGE (n:Person {id: 'Alex Chao'});

MERGE (n:Person {id: 'Apurva Mody'});

MERGE (n:Person {id: 'Steven Truitt'});

MERGE (n:Person {id: 'Dasha Metropolitansky'});

MERGE (n:Person {id: 'Robert Osazuwa Ness'});

MERGE (n:Person {id: 'Jonathan Larson'});

MERGE (n:Organization {id: 'Microsoft Research'});

MERGE (n:Organization {id: 'Microsoft Strategic Missions And Technologies'});

MERGE (n:Organization {id: 'Microsoft Office Of The Cto'});


MATCH (source:Person {id: 'Darren Edge'})
MATCH (target:Organization {id: 'Microsoft Research'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Ha Trinh'})
MATCH (target:Organization {id: 'Microsoft Research'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Newman Cheng'})
MATCH (target:Organization {id: 'Microsoft Strategic Missions And Technologies'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Joshua Bradley'})
MATCH (target:Organization {id: 'Microsoft Strategic Missions And Technologies'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Alex Chao'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Apurva Mody'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Steven Truitt'})
MATCH (target:Organization {id: 'Microsoft Strategic Missions And Technologies'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Dasha Metropolitansky'})
MATCH (target:Organization {id: 'Microsoft Research'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Robert Osazuwa Ness'})
MATCH (target:Organization {id: 'Microsoft Research'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Jonathan Larson'})
MATCH (target:Organization {id: 'Microsoft Research'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Person {id: 'Daedge'});

MERGE (n:Person {id: 'Trinhha'});

MERGE (n:Person {id: 'Newmancheng'});

MERGE (n:Person {id: 'Joshbradley'});

MERGE (n:Person {id: 'Achao'});

MERGE (n:Person {id: 'Moapurva'});

MERGE (n:Person {id: 'Steventruitt'});

MERGE (n:Person {id: 'Dasham'});

MERGE (n:Person {id: 'Robertness'});

MERGE (n:Person {id: 'Jolarso'});

MERGE (n:Concept {id: 'Retrieval-Augmented Generation (Rag)'});

MERGE (n:Concept {id: 'Large Language Models (Llms)'});


MATCH (source:Person {id: 'Daedge'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Trinhha'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Newmancheng'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Joshbradley'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Achao'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Moapurva'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Steventruitt'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Dasham'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Robertness'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Jolarso'})
MATCH (target:Organization {id: 'Microsoft Office Of The Cto'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Retrieval-Augmented Generation (Rag)'})
MATCH (target:Concept {id: 'Large Language Models (Llms)'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Technology {id: 'Rag'});

MERGE (n:Technology {id: 'Llms'});

MERGE (n:Concept {id: 'Qfs'});


MATCH (source:Technology {id: 'Rag'})
MATCH (target:Technology {id: 'Llms'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Qfs'})
MATCH (target:Technology {id: 'Rag'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Technology {id: 'Graphrag'});

MERGE (n:Technology {id: 'Rag Systems'});


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Concept {id: 'Qfs'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Technology {id: 'Rag Systems'})
MERGE (source)-[r:USES]->(target);

MERGE (n:Technology {id: 'Llm'});

MERGE (n:Concept {id: 'Entity Knowledge Graph'});

MERGE (n:Concept {id: 'Source Documents'});

MERGE (n:Concept {id: 'Community Summaries'});


MATCH (source:Technology {id: 'Llm'})
MATCH (target:Concept {id: 'Entity Knowledge Graph'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Concept {id: 'Entity Knowledge Graph'})
MATCH (target:Concept {id: 'Source Documents'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Community Summaries'})
MATCH (target:Concept {id: 'Entity Knowledge Graph'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Concept {id: 'Community Summary'});

MERGE (n:Concept {id: 'Partial Response'});

MERGE (n:Concept {id: 'Final Response'});

MERGE (n:Person {id: 'Lewis Et Al.'});


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Technology {id: 'Rag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Rag'})
MATCH (target:Person {id: 'Lewis Et Al.'})
MERGE (source)-[r:MENTIONS]->(target);

MERGE (n:Concept {id: 'Retrieval Augmented Generation (Rag)'});

MERGE (n:Person {id: 'Kuratov Et Al.'});

MERGE (n:Person {id: 'Liu Et Al.'});


MATCH (source:Concept {id: 'Retrieval Augmented Generation (Rag)'})
MATCH (target:Person {id: 'Lewis Et Al.'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Llms'})
MATCH (target:Concept {id: 'Retrieval Augmented Generation (Rag)'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Kuratov Et Al.'})
MATCH (target:Concept {id: 'Retrieval Augmented Generation (Rag)'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Liu Et Al.'})
MATCH (target:Concept {id: 'Retrieval Augmented Generation (Rag)'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Concept {id: 'External Corpus'});

MERGE (n:Concept {id: 'Query'});

MERGE (n:Concept {id: 'Context Window'});


MATCH (source:Technology {id: 'Llm'})
MATCH (target:Concept {id: 'Query'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Llm'})
MATCH (target:Concept {id: 'Context Window'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Concept {id: 'External Corpus'})
MATCH (target:Technology {id: 'Llm'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Person {id: 'Baumel Et Al.'});

MERGE (n:Person {id: 'Dang'});

MERGE (n:Person {id: 'Laskar Et Al.'});

MERGE (n:Person {id: 'Yao Et Al.'});


MATCH (source:Person {id: 'Baumel Et Al.'})
MATCH (target:Concept {id: 'Vector Rag'})
MERGE (source)-[r:MENTIONS]->(target);


MATCH (source:Person {id: 'Dang'})
MATCH (target:Concept {id: 'Vector Rag'})
MERGE (source)-[r:MENTIONS]->(target);


MATCH (source:Person {id: 'Laskar Et Al.'})
MATCH (target:Concept {id: 'Vector Rag'})
MERGE (source)-[r:MENTIONS]->(target);


MATCH (source:Person {id: 'Yao Et Al.'})
MATCH (target:Concept {id: 'Vector Rag'})
MERGE (source)-[r:MENTIONS]->(target);

MERGE (n:Technology {id: 'Vector Rag'});

MERGE (n:Concept {id: 'Sensemaking Queries'});

MERGE (n:Concept {id: 'Scientific Discoveries'});

MERGE (n:Concept {id: 'Interdisciplinary Research'});


MATCH (source:Technology {id: 'Vector Rag'})
MATCH (target:Concept {id: 'Sensemaking Queries'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Sensemaking Queries'})
MATCH (target:Concept {id: 'Scientific Discoveries'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Concept {id: 'Past Decade'});

MERGE (n:Technology {id: 'Gpt'});

MERGE (n:Technology {id: 'Llama'});

MERGE (n:Technology {id: 'Gemini'});

MERGE (n:Person {id: 'Achiam Et Al.'});

MERGE (n:Person {id: 'Brown Et Al.'});

MERGE (n:Person {id: 'Touvron Et Al.'});

MERGE (n:Person {id: 'Anil Et Al.'});

MERGE (n:Organization {id: 'Microsoft'});

MERGE (n:Concept {id: 'Scientific Discovery'});

MERGE (n:Concept {id: 'Intelligence Analysis'});


MATCH (source:Technology {id: 'Gpt'})
MATCH (target:Person {id: 'Achiam Et Al.'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Llama'})
MATCH (target:Person {id: 'Touvron Et Al.'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Gemini'})
MATCH (target:Person {id: 'Anil Et Al.'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Gpt'})
MATCH (target:Concept {id: 'Scientific Discovery'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Llama'})
MATCH (target:Concept {id: 'Scientific Discovery'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Gemini'})
MATCH (target:Concept {id: 'Scientific Discovery'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Gpt'})
MATCH (target:Concept {id: 'Intelligence Analysis'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Llama'})
MATCH (target:Concept {id: 'Intelligence Analysis'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Gemini'})
MATCH (target:Concept {id: 'Intelligence Analysis'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Concept {id: 'Llm'});

MERGE (n:Concept {id: 'Rag'});

MERGE (n:Concept {id: 'Graphrag'});

MERGE (n:Concept {id: 'Vector Rag'});

MERGE (n:Concept {id: 'Corpus'});


MATCH (source:Concept {id: 'Llm'})
MATCH (target:Concept {id: 'Rag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Rag'})
MATCH (target:Concept {id: 'Vector Rag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Graphrag'})
MATCH (target:Concept {id: 'Rag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Graphrag'})
MATCH (target:Concept {id: 'Corpus'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Concept {id: 'Knowledge Graph'});


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Technology {id: 'Llm'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Concept {id: 'Knowledge Graph'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Concept {id: 'Map-Reduce Processing'});


MATCH (source:Concept {id: 'Community Summaries'})
MATCH (target:Technology {id: 'Graphrag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Concept {id: 'Map-Reduce Processing'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Concept {id: 'Map-Reduce Processing'})
MATCH (target:Concept {id: 'Query'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Concept {id: 'Graphrag Method'});

MERGE (n:Concept {id: 'Llm-As-A-Judge Technique'});

MERGE (n:Organization {id: 'Zheng Et Al.'});


MATCH (source:Concept {id: 'Graphrag Method'})
MATCH (target:Concept {id: 'Llm-As-A-Judge Technique'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Llm-As-A-Judge Technique'})
MATCH (target:Organization {id: 'Zheng Et Al.'})
MERGE (source)-[r:MENTIONS]->(target);

MERGE (n:Person {id: 'Zheng Et Al.'});


MATCH (source:Concept {id: 'Llm-As-A-Judge Technique'})
MATCH (target:Person {id: 'Zheng Et Al.'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Llm-As-A-Judge Technique'})
MATCH (target:Technology {id: 'Rag Systems'})
MERGE (source)-[r:USES]->(target);

MERGE (n:Technology {id: 'Gpt-4'});


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Technology {id: 'Gpt-4'})
MERGE (source)-[r:USES]->(target);

MERGE (n:Technology {id: 'Langchain'});

MERGE (n:Technology {id: 'Llamaindex'});

MERGE (n:Technology {id: 'Nebulagraph'});

MERGE (n:Technology {id: 'Neo4J'});

MERGE (n:Organization {id: 'Nebulagraph'});

MERGE (n:Organization {id: 'Neo4J'});


MATCH (source:Organization {id: 'Nebulagraph'})
MATCH (target:Concept {id: 'Rag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Organization {id: 'Neo4J'})
MATCH (target:Concept {id: 'Rag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Rag'})
MATCH (target:Concept {id: 'Llm'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Person {id: 'Ram Et Al.'});

MERGE (n:Concept {id: 'Prompt Template'});


MATCH (source:Technology {id: 'Llm'})
MATCH (target:Technology {id: 'Rag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Ram Et Al.'})
MATCH (target:Technology {id: 'Rag'})
MERGE (source)-[r:MENTIONS]->(target);

MERGE (n:Concept {id: 'Retrieval Process'});

MERGE (n:Concept {id: 'Answer'});

MERGE (n:Concept {id: 'Records'});

MERGE (n:Concept {id: 'Text Embeddings'});


MATCH (source:Concept {id: 'Rag'})
MATCH (target:Concept {id: 'Retrieval Process'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Concept {id: 'Retrieval Process'})
MATCH (target:Concept {id: 'Query'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Answer'})
MATCH (target:Concept {id: 'Records'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Concept {id: 'Retrieval Process'})
MATCH (target:Concept {id: 'Text Embeddings'})
MERGE (source)-[r:USES]->(target);

MERGE (n:Person {id: 'Gao Et Al.'});


MATCH (source:Concept {id: 'Rag'})
MATCH (target:Concept {id: 'Graphrag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Rag'})
MATCH (target:Concept {id: 'Vector Rag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Gao Et Al.'})
MATCH (target:Concept {id: 'Rag'})
MERGE (source)-[r:MENTIONS]->(target);

MERGE (n:Concept {id: 'Rag Strategies'});


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Technology {id: 'Vector Rag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Concept {id: 'Rag Strategies'})
MERGE (source)-[r:USES]->(target);

MERGE (n:Concept {id: 'Cheng Et Al. 2024'});

MERGE (n:Concept {id: 'Mao Et Al. 2020'});

MERGE (n:Concept {id: 'Feng Et Al.'});


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Concept {id: 'Cheng Et Al. 2024'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Concept {id: 'Mao Et Al. 2020'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Concept {id: 'Feng Et Al.'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Person {id: 'Khattab Et Al.'});

MERGE (n:Person {id: 'Shao Et Al.'});

MERGE (n:Person {id: 'Su Et Al.'});

MERGE (n:Person {id: 'Trivedi Et Al.'});

MERGE (n:Person {id: 'Wang Et Al.'});

MERGE (n:Person {id: 'Kim Et Al.'});

MERGE (n:Person {id: 'Sarthi Et Al.'});


MATCH (source:Person {id: 'Gao Et Al.'})
MATCH (target:Technology {id: 'Graphrag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Khattab Et Al.'})
MATCH (target:Technology {id: 'Graphrag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Shao Et Al.'})
MATCH (target:Technology {id: 'Graphrag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Su Et Al.'})
MATCH (target:Technology {id: 'Graphrag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Trivedi Et Al.'})
MATCH (target:Technology {id: 'Graphrag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Wang Et Al.'})
MATCH (target:Technology {id: 'Graphrag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Kim Et Al.'})
MATCH (target:Technology {id: 'Graphrag'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Person {id: 'Sarthi Et Al.'})
MATCH (target:Technology {id: 'Graphrag'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Concept {id: 'Knowledge Graphs'});


MATCH (source:Concept {id: 'Knowledge Graphs'})
MATCH (target:Technology {id: 'Llms'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Concept {id: 'Knowledge Graphs'})
MATCH (target:Technology {id: 'Rag'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Concept {id: 'Rule-Matching'});

MERGE (n:Concept {id: 'Statistical Pattern Recognition'});

MERGE (n:Concept {id: 'Clustering'});

MERGE (n:Concept {id: 'Embeddings'});

MERGE (n:Organization {id: 'Etzioni Et Al.'});

MERGE (n:Organization {id: 'Kim Et Al.'});

MERGE (n:Organization {id: 'Mooney And Bunescu'});

MERGE (n:Organization {id: 'Yates Et Al.'});

MERGE (n:Concept {id: 'Llms'});

MERGE (n:Organization {id: 'Ban Et Al.'});

MERGE (n:Organization {id: 'Melnyk Et Al.'});


MATCH (source:Organization {id: 'Etzioni Et Al.'})
MATCH (target:Concept {id: 'Rule-Matching'})
MERGE (source)-[r:MENTIONS]->(target);


MATCH (source:Organization {id: 'Kim Et Al.'})
MATCH (target:Concept {id: 'Statistical Pattern Recognition'})
MERGE (source)-[r:MENTIONS]->(target);


MATCH (source:Organization {id: 'Mooney And Bunescu'})
MATCH (target:Concept {id: 'Clustering'})
MERGE (source)-[r:MENTIONS]->(target);


MATCH (source:Organization {id: 'Yates Et Al.'})
MATCH (target:Concept {id: 'Embeddings'})
MERGE (source)-[r:MENTIONS]->(target);


MATCH (source:Concept {id: 'Graphrag'})
MATCH (target:Concept {id: 'Llms'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Organization {id: 'Ban Et Al.'})
MATCH (target:Concept {id: 'Graphrag'})
MERGE (source)-[r:MENTIONS]->(target);


MATCH (source:Organization {id: 'Melnyk Et Al.'})
MATCH (target:Concept {id: 'Graphrag'})
MERGE (source)-[r:MENTIONS]->(target);

MERGE (n:Organization {id: 'Openai'});

MERGE (n:Concept {id: 'Rag Approaches'});


MATCH (source:Organization {id: 'Openai'})
MATCH (target:Technology {id: 'Llms'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Concept {id: 'Rag Approaches'})
MATCH (target:Concept {id: 'Knowledge Graph'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Organization {id: 'Gao Et Al.'});

MERGE (n:Organization {id: 'Baek Et Al.'});

MERGE (n:Organization {id: 'He Et Al.'});

MERGE (n:Person {id: 'Zhang'});

MERGE (n:Organization {id: 'Kang Et Al.'});

MERGE (n:Organization {id: 'Ranade And Joshi'});

MERGE (n:Organization {id: 'Wang Et Al.'});


MATCH (source:Organization {id: 'Gao Et Al.'})
MATCH (target:Concept {id: 'Index'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Organization {id: 'Baek Et Al.'})
MATCH (target:Concept {id: 'Subgraphs'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Organization {id: 'He Et Al.'})
MATCH (target:Concept {id: 'Graph Structure'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Person {id: 'Zhang'})
MATCH (target:Concept {id: 'Graph Structure'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Organization {id: 'Kang Et Al.'})
MATCH (target:Concept {id: 'Factual Grounding'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Organization {id: 'Ranade And Joshi'})
MATCH (target:Concept {id: 'Factual Grounding'})
MERGE (source)-[r:USES]->(target);

MERGE (n:Technology {id: 'Llm-Based Agent'});


MATCH (source:Person {id: 'Wang Et Al.'})
MATCH (target:Concept {id: 'Knowledge Graph'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Technology {id: 'Llm-Based Agent'})
MATCH (target:Concept {id: 'Knowledge Graph'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Concept {id: 'Graphrag'})
MATCH (target:Concept {id: 'Knowledge Graph'})
MERGE (source)-[r:RELATED_TO]->(target);

MERGE (n:Person {id: 'Newman'});

MERGE (n:Technology {id: 'Louvain'});

MERGE (n:Person {id: 'Blondel'});

MERGE (n:Technology {id: 'Leiden'});

MERGE (n:Person {id: 'Traag'});


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Person {id: 'Newman'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Technology {id: 'Louvain'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Person {id: 'Blondel'})
MERGE (source)-[r:RELATED_TO]->(target);


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Technology {id: 'Leiden'})
MERGE (source)-[r:USES]->(target);


MATCH (source:Technology {id: 'Graphrag'})
MATCH (target:Person {id: 'Traag'})
MERGE (source)-[r:RELATED_TO]->(target);

