# Connecting the Dots Challenge (Round 1A) at the Adobe Hackathon 2025

 ## Overview of the Project
 This solution was developed for the Adobe Hackathon 2025's **Round 1A - "Understand Your Document"**.  

 In order to **extract a structured outline from PDFs**, the primary objective is to identify:
 Page numbers and the headings ({H1`, `H2`, `H3`) are included in the title.

 **Semantic search, document intelligence, and advanced document analytics** are built on top of the output.


 ## Key Features 
 1. **Dynamic Font Analysis** – This feature analyzes distinct font sizes to automatically identify heading levels (`H1`, `H2`, `H3`).  
 2. **Title Detection** – Chooses the **most frequent candidate** or **largest font text** in the first two pages.  
 3. **Multilingual Compatibility** - Unicode (`NFKC`) is used to normalize text for improved support in multiple languages.  
 4. **Broken Headings Merge** - Correctly merges multi-line headings to fix them.  
 5. **Hackathon Rules Adhered to**  The entire process is done **offline** on the CPU. The execution time for 50 pages is ≤ 10 seconds. The model size is ≤ 200MB.

 ##  Folder Structure
adobe_round1a/

├── Dockerfile                                   # Dockerized execution (mandatory for judging)

├── requirements.txt                             # Python dependencies

├── extract.py                                   # Main script for title & headings extraction

├── input/
│   └── sample.pdf                               # Sample PDF for testing

└── output/
    └── sample.json                              # Auto-generated output JSON


## Tech Stack
- **Language**: Python 3.9  
- **Libraries**:
  - `PyMuPDF (fitz)` – For PDF text extraction  
  - `unicodedata`, `re`, `collections` – Text cleaning & heading merging  
  - `json`, `os` – JSON output generation & file handling


## Execution Instructions

### Build the Docker Image
docker build --no-cache -t adobe_round1a .

### Run the Container
docker run --rm -v ${PWD}/input:/app/input -v ${PWD}/output:/app/output --network none adobe_round1a

### Automatic Workflow:

1. Reads all PDFs from /input
2. Extracts the title & headings
3. Saves a corresponding .json file in /output


### Sample Output (JSON)
```json
{
  "title": "Welcome to the “Connecting the Dots” Challenge",
  "outline": [
    { "level": "H1", "text": "Welcome to the “Connecting the Dots” Challenge", "page": 1 },
    { "level": "H2", "text": "Rethink Reading. Rediscover Knowledge...", "page": 1 },
    { "level": "H1", "text": "Round 1A: Understand Your Document", "page": 2 }
  ]
}
```

### Highlights of the Scoring
1. Accuracy of Heading Detection: Attained using dynamic font-size mapping
2. Performance: No network calls, complies with hackathon restrictions
3. Bonus: Multilingual document capability is enhanced by unicode text normalization.

### Authors
1. Dubbaka Varsha
2. Gandla Anjali 

### For Judges
1. Place any PDF inside `/input`
2. Run the Docker commands mentioned above
3. Check `/output` for the generated JSON
