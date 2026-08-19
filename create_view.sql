USE `learn_jp_n5`;
CREATE VIEW `v_today_due_reviews` AS
SELECT 
    rs.id AS schedule_id,
    rs.item_type,
    rs.item_id,
    u.unit_number,
    COALESCE(v.japanese, g.title) AS japanese_word,
    COALESCE(v.hiragana, g.pattern) AS reading_hiragana,
    v.romaji,
    v.word_type,
    COALESCE(
        (SELECT GROUP_CONCAT(vm.vietnamese_meaning SEPARATOR ' / ') FROM vocabulary_meanings vm WHERE vm.vocabulary_id = v.id),
        (SELECT GROUP_CONCAT(gm.explanation SEPARATOR ' / ') FROM grammar_meanings gm WHERE gm.grammar_id = g.id)
    ) AS vietnamese_meaning,
    COALESCE(
        (SELECT GROUP_CONCAT(vm.example_sentence SEPARATOR ' | ') FROM vocabulary_meanings vm WHERE vm.vocabulary_id = v.id),
        (SELECT GROUP_CONCAT(gm.example_sentence SEPARATOR ' | ') FROM grammar_meanings gm WHERE gm.grammar_id = g.id)
    ) AS example_sentence,
    COALESCE(
        (SELECT GROUP_CONCAT(vm.example_meaning SEPARATOR ' | ') FROM vocabulary_meanings vm WHERE vm.vocabulary_id = v.id),
        (SELECT GROUP_CONCAT(gm.example_meaning SEPARATOR ' | ') FROM grammar_meanings gm WHERE gm.grammar_id = g.id)
    ) AS example_meaning,
    rs.next_review_date,
    rs.review_count,
    rs.status
FROM `review_schedules` rs
LEFT JOIN `vocabularies` v ON rs.item_type = 'VOCABULARY' AND rs.item_id = v.id
LEFT JOIN `grammars` g ON rs.item_type = 'GRAMMAR' AND rs.item_id = g.id
LEFT JOIN `units` u ON (v.unit_id = u.id OR g.unit_id = u.id)
WHERE rs.next_review_date <= CURDATE()
  AND rs.status = 'LEARNING';
