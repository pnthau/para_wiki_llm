import type { LessonData, Sentence } from '../types';

export const parseFrontmatter = (md: string) => {
  const match = md.match(/^---\n([\s\S]*?)\n---\n([\s\S]*)$/);
  if (!match) return { data: {} as any, content: md };
  
  const yaml = match[1];
  const content = match[2];
  const data: any = {};
  
  yaml.split('\n').forEach(line => {
    const [key, ...val] = line.split(':');
    if (key && val.length > 0) {
      let value = val.join(':').trim();
      if (value.startsWith('[') && value.endsWith(']')) {
        data[key.trim()] = value.slice(1, -1).split(',').map(s => s.trim().replace(/^["'](.*)["']$/, '$1'));
      } else {
        data[key.trim()] = value.replace(/^["'](.*)["']$/, '$1');
      }
    }
  });
  
  return { data, content };
};

export const parseLessonMarkdown = (mdContent: string): LessonData => {
  const { data, content } = parseFrontmatter(mdContent);
  
  // Extract video URL
  const videoMatch = content.match(/<source src="(.*?)"/);
  const videoUrl = videoMatch ? videoMatch[1] : '';

  // Parse Transcript table
  const lines = content.split('\n');
  const sentences: Sentence[] = [];
  
  let inTranscript = false;
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i].trim();
    if (line.includes('| Lời thoại (Nhật) |')) {
      inTranscript = true;
      i++; // skip separator line
      continue;
    }
    
    if (inTranscript) {
      if (line.startsWith('|')) {
        const parts = line.split('|').map(p => p.trim()).filter((_, idx) => idx > 0);
        if (parts.length >= 4) {
          sentences.push({
            start: 0,
            end: 0,
            jp: parts[1],
            furi: parts[2],
            vn: parts[3]
          });
        }
      } else if (line === '' && sentences.length > 0) {
        inTranscript = false;
      }
    }
  }

  // Unit 1 Timestamps fallback
  if (data.tags && data.tags.includes('unit1')) {
     const unit1Timestamps = [
        { s: 0.1, e: 4 },
        { s: 4.1, e: 8 },
        { s: 8.5, e: 13 },
        { s: 13.5, e: 17 },
        { s: 18, e: 23 },
        { s: 23.5, e: 28 }
     ];
     sentences.forEach((s, idx) => {
       if (unit1Timestamps[idx]) {
         s.start = unit1Timestamps[idx].s;
         s.end = unit1Timestamps[idx].e;
       }
     });
  }

  return {
    title: data.title || 'Lesson',
    videoUrl,
    sentences,
    vocabulary: [], 
    grammar: []     
  };
};
