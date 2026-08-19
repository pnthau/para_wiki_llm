import os
import re

def parse_sql_tuples(values_str):
    tuples = []
    current_tuple = ""
    in_string = False
    depth = 0
    for char in values_str:
        if char == "'":
            in_string = not in_string
        elif char == '(' and not in_string:
            depth += 1
            if depth == 1: continue
        elif char == ')' and not in_string:
            depth -= 1
            if depth == 0:
                tuples.append(current_tuple)
                current_tuple = ""
                continue
        if depth > 0:
            current_tuple += char
            
    res = []
    for t in tuples:
        fields = []
        curr_field = ""
        in_str = False
        for c in t:
            if c == "'":
                in_str = not in_str
                curr_field += c
            elif c == ',' and not in_str:
                fields.append(curr_field.strip())
                curr_field = ""
            else:
                curr_field += c
        fields.append(curr_field.strip())
        res.append(fields)
    return res

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # vocabularies
    vocab_pattern = re.compile(r'(INSERT (?:IGNORE )?INTO `vocabularies` .*? VALUES\s*)([\s\S]*?);')
    def repl_vocab(match):
        values_str = match.group(2)
        parsed = parse_sql_tuples(values_str)
        
        vocab_lines = []
        meaning_lines = []
        for fields in parsed:
            if len(fields) == 9:
                vocab_lines.append(f"({fields[0]}, {fields[1]}, {fields[2]}, {fields[3]}, {fields[4]}, {fields[6]})")
                meaning_lines.append(f"({fields[0]}, {fields[5]}, {fields[7]}, {fields[8]})")
            else:
                return match.group(0)
                
        new_vocab_insert = "INSERT IGNORE INTO `vocabularies` (`id`, `unit_id`, `japanese`, `hiragana`, `romaji`, `word_type`) VALUES\n" + ",\n".join(vocab_lines) + ";"
        new_meaning_insert = "INSERT INTO `vocabulary_meanings` (`vocabulary_id`, `vietnamese_meaning`, `example_sentence`, `example_meaning`) VALUES\n" + ",\n".join(meaning_lines) + ";"
        return new_vocab_insert + "\n\n" + new_meaning_insert

    content = vocab_pattern.sub(repl_vocab, content)
    
    # grammars
    grammar_pattern = re.compile(r'(INSERT (?:IGNORE )?INTO `grammars` .*? VALUES\s*)([\s\S]*?);')
    def repl_grammar(match):
        values_str = match.group(2)
        parsed = parse_sql_tuples(values_str)
        
        gram_lines = []
        meaning_lines = []
        for fields in parsed:
            if len(fields) == 7:
                gram_lines.append(f"({fields[0]}, {fields[1]}, {fields[2]}, {fields[3]})")
                meaning_lines.append(f"({fields[0]}, {fields[4]}, {fields[5]}, {fields[6]})")
            else:
                return match.group(0)
                
        new_gram_insert = "INSERT IGNORE INTO `grammars` (`id`, `unit_id`, `title`, `pattern`) VALUES\n" + ",\n".join(gram_lines) + ";"
        new_meaning_insert = "INSERT INTO `grammar_meanings` (`grammar_id`, `explanation`, `example_sentence`, `example_meaning`) VALUES\n" + ",\n".join(meaning_lines) + ";"
        return new_gram_insert + "\n\n" + new_meaning_insert

    content = grammar_pattern.sub(repl_grammar, content)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

folder = r"D:\data\para_wiki_llm"
for fname in os.listdir(folder):
    if fname.endswith(".sql") and fname not in ["migrate_to_multi_meaning.sql", "add_unique_constraints.sql"]:
        process_file(os.path.join(folder, fname))
