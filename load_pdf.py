from langchain_community.document_loaders import PyPDFLoader

file_path = "2404.16130v2.pdf"
loader = PyPDFLoader(file_path)
docs = loader.load()

with open("output.txt", "w", encoding="utf-8") as f:
    try:
        for doc in docs:
            f.write(doc.page_content)
            f.write("\n" + "-"*80 + "\n")
    except Exception as e:
            print("Error loading:", e)