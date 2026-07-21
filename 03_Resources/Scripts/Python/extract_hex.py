import re
import json

# 1. Extract 64 Hexagrams
with open(r'D:\data\para_wiki_llm\01_Projects\phong-thuy-web\index.html', 'r', encoding='utf-8') as f:
    content = f.read()

match = re.search(r'const hexagrams = \[(.*?)\];', content, re.DOTALL)
if match:
    hex_data_raw = match.group(1)
    hexagrams = []
    pattern = r'\{\s*name:\s*"([^"]+)",\s*han:\s*"([^"]+)",\s*lines:\s*\[([\d,]+)\],\s*fortune:\s*"([^"]+)",\s*meaning:\s*"([^"]+)",\s*advice:\s*"([^"]+)"\s*\}'
    for m in re.finditer(pattern, hex_data_raw):
        hexagrams.append({
            "id": len(hexagrams) + 1,
            "name": m.group(1),
            "han": m.group(2),
            "lines": [int(x) for x in m.group(3).split(',')],
            "fortune": m.group(4),
            "meaning": m.group(5),
            "advice": m.group(6)
        })
    
    with open(r'D:\data\para_wiki_llm\02_Areas\Kinh_Dich\64_Que_Data.json', 'w', encoding='utf-8') as f:
        json.dump(hexagrams, f, ensure_ascii=False, indent=4)
        
    md_content = "---\ndomain: Kinh_Dich\ntype: dataset\nstatus: active\n---\n# Dữ Liệu 64 Quẻ Kinh Dịch\n\n| ID | Tên Quẻ | Hán Tự | Cát Hung | Ý Nghĩa | Lời Khuyên |\n|---|---|---|---|---|---|\n"
    for h in hexagrams:
        md_content += f"| {h['id']} | **{h['name']}** | {h['han']} | {h['fortune']} | {h['meaning']} | {h['advice']} |\n"
        
    with open(r'D:\data\para_wiki_llm\02_Areas\Kinh_Dich\64_Que_Data.md', 'w', encoding='utf-8') as f:
        f.write(md_content)
    print(f"Extracted {len(hexagrams)} hexagrams.")
else:
    print("Failed to find HEXAGRAMS.")
