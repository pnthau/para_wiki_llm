import json
import sys
import uuid
import random
import argparse
import io

def generate_id():
    return str(uuid.uuid4())

def create_element(type, x, y, width, height, text="", bg_color="transparent", stroke_color="#1e1e1e", font_size=16, roughness=1, shadow=True):
    el_id = generate_id()
    group_id = generate_id()
    elements = []

    # Shadow effect
    if shadow and bg_color != "transparent":
        shadow_id = generate_id()
        shadow_el = {
            "id": shadow_id,
            "type": type,
            "x": x + 5,
            "y": y + 5,
            "width": width,
            "height": height,
            "angle": 0,
            "strokeColor": "transparent",
            "backgroundColor": "#00000020",
            "fillStyle": "solid",
            "strokeWidth": 0,
            "strokeStyle": "solid",
            "roughness": 0,
            "opacity": 40,
            "groupIds": [group_id],
            "frameId": None,
            "roundness": {"type": 3} if type == "rectangle" else None,
            "seed": random.randint(1, 100000),
            "version": 1,
            "versionNonce": random.randint(1, 100000),
            "isDeleted": False,
            "boundElements": [],
            "updated": 1,
            "link": None,
            "locked": False
        }
        elements.append(shadow_el)

    text_id = generate_id() if text else None
    
    element = {
        "id": el_id,
        "type": type,
        "x": x,
        "y": y,
        "width": width,
        "height": height,
        "angle": 0,
        "strokeColor": stroke_color,
        "backgroundColor": bg_color,
        "fillStyle": "solid",
        "strokeWidth": 2,
        "strokeStyle": "solid",
        "roughness": roughness,
        "opacity": 100,
        "groupIds": [group_id],
        "frameId": None,
        "roundness": {"type": 3} if type == "rectangle" else None,
        "seed": random.randint(1, 100000),
        "version": 1,
        "versionNonce": random.randint(1, 100000),
        "isDeleted": False,
        "boundElements": [{"id": text_id, "type": "text"}] if text_id else [],
        "updated": 1,
        "link": None,
        "locked": False
    }
    elements.append(element)
    
    if text:
        # Better text measurement logic
        lines = text.split('\n')
        line_count = len(lines)
        # Use a safe average char width for Virgil font
        avg_char_width = font_size * 0.55
        max_line_chars = max(len(line) for line in lines)
        text_width = max_line_chars * avg_char_width
        text_height = font_size * 1.2 * line_count
        
        # Center inside container
        text_x = x + (width - text_width) / 2
        text_y = y + (height - text_height) / 2
        
        text_element = {
            "id": text_id,
            "type": "text",
            "x": text_x,
            "y": text_y,
            "width": text_width,
            "height": text_height,
            "angle": 0,
            "strokeColor": stroke_color,
            "backgroundColor": "transparent",
            "fillStyle": "hachure",
            "strokeWidth": 1,
            "strokeStyle": "solid",
            "roughness": 1,
            "opacity": 100,
            "groupIds": [group_id],
            "frameId": None,
            "roundness": None,
            "seed": random.randint(1, 100000),
            "version": 1,
            "versionNonce": random.randint(1, 100000),
            "isDeleted": False,
            "boundElements": [],
            "updated": 1,
            "link": None,
            "locked": False,
            "text": text,
            "rawText": text,
            "fontSize": font_size,
            "fontFamily": 1,
            "textAlign": "center",
            "verticalAlign": "middle",
            "containerId": el_id,
            "originalText": text,
            "lineHeight": 1.2
        }
        elements.append(text_element)
    
    return elements

def create_arrow(start_el, end_el):
    # Calculate side-to-side points for horizontal layout
    start_side_x = start_el["x"] + (start_el["width"] if end_el["x"] > start_el["x"] else 0)
    start_side_y = start_el["y"] + start_el["height"] / 2
    
    end_side_x = end_el["x"] + (0 if end_el["x"] > start_el["x"] else end_el["width"])
    end_side_y = end_el["y"] + end_el["height"] / 2
    
    arrow = {
        "id": generate_id(),
        "type": "arrow",
        "x": start_side_x,
        "y": start_side_y,
        "width": abs(end_side_x - start_side_x),
        "height": abs(end_side_y - start_side_y),
        "angle": 0,
        "strokeColor": "#868e96",
        "backgroundColor": "transparent",
        "fillStyle": "hachure",
        "strokeWidth": 1.5,
        "strokeStyle": "solid",
        "roughness": 1,
        "opacity": 100,
        "groupIds": [],
        "frameId": None,
        "roundness": {"type": 2},
        "seed": random.randint(1, 100000),
        "version": 1,
        "versionNonce": random.randint(1, 100000),
        "isDeleted": False,
        "boundElements": [],
        "updated": 1,
        "link": None,
        "locked": False,
        "points": [[0, 0], [end_side_x - start_side_x, end_side_y - start_side_y]],
        "lastCommittedPoint": None,
        "startBinding": {"elementId": start_el["id"], "focus": 0, "gap": 5},
        "endBinding": {"elementId": end_el["id"], "focus": 0, "gap": 5},
        "startArrowhead": None,
        "endArrowhead": "arrow"
    }
    return arrow

def build_horizontal_mindmap(data):
    elements = []
    root_text = data.get("root", "Mindmap")
    
    # Constants
    NODE_WIDTH = 220
    NODE_HEIGHT = 70
    H_GAP = 120
    V_GAP = 100
    
    # Root node at (0, 0)
    root_nodes = create_element("rectangle", -NODE_WIDTH/2, -NODE_HEIGHT/2, NODE_WIDTH, NODE_HEIGHT, root_text, "#ff8787", font_size=24, roughness=1.5)
    root_el = [e for e in root_nodes if e["type"] == "rectangle" and e.get("backgroundColor") != "#00000020"][0]
    elements.extend(root_nodes)
    
    branches = data.get("branches", [])
    mid = (len(branches) + 1) // 2
    left_branches = branches[mid:]
    right_branches = branches[:mid]
    
    colors = ["#74c0fc", "#63e6be", "#ffc078", "#fff3bf", "#91a7ff", "#f06595"]

    def layout_side(side_branches, is_right, start_color_idx):
        total_height = (len(side_branches) - 1) * V_GAP
        start_y = -total_height / 2
        
        for i, branch in enumerate(side_branches):
            bx = (NODE_WIDTH/2 + H_GAP) if is_right else -(NODE_WIDTH/2 + H_GAP + NODE_WIDTH)
            by = start_y + i * V_GAP
            
            color = colors[(start_color_idx + i) % len(colors)]
            branch_nodes = create_element("rectangle", bx, by, NODE_WIDTH, NODE_HEIGHT, branch.get("text", ""), color, roughness=1.2)
            branch_el = [e for e in branch_nodes if e["type"] == "rectangle" and e.get("backgroundColor") != "#00000020"][0]
            elements.extend(branch_nodes)
            elements.append(create_arrow(root_el, branch_el))
            
            sub_branches = branch.get("sub", [])
            sub_total_h = (len(sub_branches) - 1) * 70
            sub_start_y = by + (NODE_HEIGHT/2) - (sub_total_h/2) - 25
            
            for j, sub_text in enumerate(sub_branches):
                sx = bx + (NODE_WIDTH + H_GAP/2) if is_right else bx - (NODE_WIDTH*0.8 + H_GAP/2)
                sy = sub_start_y + j * 70
                
                sub_nodes = create_element("rectangle", sx, sy, NODE_WIDTH*0.8, 55, sub_text, color, font_size=14, shadow=False)
                sub_el = [e for e in sub_nodes if e["type"] == "rectangle"][0]
                elements.extend(sub_nodes)
                elements.append(create_arrow(branch_el, sub_el))

    layout_side(right_branches, True, 0)
    layout_side(left_branches, False, len(right_branches))

    return {
        "type": "excalidraw",
        "version": 2,
        "source": "visual-architect-nexus-v3",
        "elements": elements,
        "appState": {"theme": "dark", "viewBackgroundColor": "#1e1e1e"},
        "files": {}
    }

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", help="Output file path")
    args = parser.parse_args()

    try:
        # Handle input safely to avoid PowerShell encoding mess
        input_str = sys.stdin.read()
        input_data = json.loads(input_str)
        
        output = build_horizontal_mindmap(input_data)
        json_output = json.dumps(output, indent=2, ensure_ascii=False)
        
        if args.out:
            with open(args.out, "w", encoding="utf-8") as f:
                f.write(json_output)
        else:
            sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
            sys.stdout.write(json_output)
        
    except Exception as e:
        print(f"Error: {str(e)}", file=sys.stderr)
        sys.exit(1)
