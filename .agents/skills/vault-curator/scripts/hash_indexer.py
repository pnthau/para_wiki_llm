import os
import json

VAULT_DIR = r"d:\Data\para_wiki_llm"
OUTPUT_FILE = os.path.join(VAULT_DIR, ".agents", "hash_index.json")

def parse_frontmatter_manual(content):
    """Very simple YAML parser for standard frontmatter without pyyaml dependency"""
    fm = {}
    if not content.startswith("---"):
        return fm
    
    parts = content.split("---", 2)
    if len(parts) < 3:
        return fm
        
    yaml_text = parts[1]
    for line in yaml_text.splitlines():
        line = line.strip()
        if not line or ":" not in line:
            continue
        # Only split on first colon
        key, val = line.split(":", 1)
        key = key.strip()
        val = val.strip().strip("[]\"'")
        
        if key in ['tags', 'keywords']:
            items = [x.strip() for x in val.split(',')]
            fm[key] = [x for x in items if x]
        else:
            fm[key] = val
    return fm

def build_index():
    index = {}
    file_count = 0
    for root, dirs, files in os.walk(VAULT_DIR):
        # Skip hidden directories
        dirs[:] = [d for d in dirs if not d.startswith('.')]
        
        for file in files:
            if file.endswith(".md"):
                file_count += 1
                file_path = os.path.join(root, file)
                try:
                    with open(file_path, "r", encoding="utf-8") as f:
                        content = f.read()
                    
                    fm = parse_frontmatter_manual(content)
                    keys = []
                    if 'tags' in fm:
                        keys.extend(fm['tags'])
                    if 'keywords' in fm:
                        keys.extend(fm['keywords'])
                    if 'domain' in fm:
                        keys.append(fm['domain'])
                    
                    # Use filename without extension as fallback key
                    basename = os.path.splitext(file)[0]
                    keys.append(basename)
                    
                    # Normalize path format
                    rel_path = os.path.relpath(file_path, VAULT_DIR).replace("\\", "/")
                    
                    for key in set(keys):
                        k = key.lower().strip()
                        if k:
                            if k not in index:
                                index[k] = []
                            if rel_path not in index[k]:
                                index[k].append(rel_path)
                except Exception as e:
                    print(f"Error reading {file_path}: {e}")

    os.makedirs(os.path.dirname(OUTPUT_FILE), exist_ok=True)
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(index, f, indent=2, ensure_ascii=False)
    
    print(f"Success! Indexed {file_count} markdown files.")
    print(f"Generated Hash Table (HashMap) at {OUTPUT_FILE} with {len(index)} distinct keys.")

if __name__ == "__main__":
    build_index()
