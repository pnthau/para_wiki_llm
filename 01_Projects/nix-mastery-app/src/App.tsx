import { useState, useEffect } from 'react';
import ShadowingPlayer from './components/ShadowingPlayer';
import { parseLessonMarkdown } from './utils/markdownParser';
import type { LessonData } from './types';
import { BookOpen, Languages } from 'lucide-react';

function App() {
  const [lesson, setLesson] = useState<LessonData | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // In production, the base path might be different
    const basePath = import.meta.env.BASE_URL;
    fetch(`${basePath}content/unit1.md`)
      .then(res => res.text())
      .then(text => {
        const parsed = parseLessonMarkdown(text);
        setLesson(parsed);
        setLoading(false);
      })
      .catch(err => {
        console.error('Error loading lesson:', err);
        setLoading(false);
      });
  }, []);

  if (loading) return (
    <div className="h-screen flex items-center justify-center bg-slate-900 text-white">
      <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-indigo-500"></div>
    </div>
  );

  return (
    <div className="min-h-screen bg-slate-50 flex flex-col">
      {/* Header */}
      <header className="h-16 bg-slate-900 text-white flex items-center justify-between px-8 shadow-md">
        <div className="flex items-center gap-3">
          <div className="p-2 bg-indigo-600 rounded-lg">
            <BookOpen size={24} />
          </div>
          <h1 className="text-xl font-bold tracking-tight">NiX Mastery App</h1>
        </div>
        
        <div className="flex items-center gap-6">
          <nav className="hidden md:flex gap-4 text-sm font-medium text-slate-400">
            <a href="#" className="hover:text-white transition-colors text-white border-b-2 border-indigo-500">Unit 1</a>
            <a href="#" className="hover:text-white transition-colors">Unit 12</a>
          </nav>
          <a 
            href="https://github.com/pnthau/para_wiki_llm" 
            target="_blank" 
            className="p-2 hover:bg-slate-800 rounded-full transition-colors"
          >
            <Languages size={20} />
          </a>
        </div>
      </header>

      {/* Main Content */}
      <main className="flex-1">
        {lesson && <ShadowingPlayer lesson={lesson} />}
      </main>
    </div>
  );
}

export default App;
