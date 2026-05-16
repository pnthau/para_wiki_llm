export interface Sentence {
  start: number;
  end: number;
  jp: string;
  furi: string;
  vn: string;
}

export interface LessonData {
  title: string;
  videoUrl: string;
  sentences: Sentence[];
  vocabulary: VocabularyItem[];
  grammar: GrammarItem[];
}

export interface VocabularyItem {
  hiragana: string;
  kanji: string;
  meaning: string;
}

export interface GrammarItem {
  title: string;
  description: string;
  examples: string[];
}
