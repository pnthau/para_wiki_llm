import React, { useState, useRef } from 'react';
import { Play, RotateCcw, Eye, EyeOff } from 'lucide-react';
import type { LessonData } from '../types';

interface Props {
  lesson: LessonData;
}

const ShadowingPlayer: React.FC<Props> = ({ lesson }) => {
  const [currentIdx, setCurrentIdx] = useState(0);
  const [showFuri, setShowFuri] = useState(true);
  const videoRef = useRef<HTMLVideoElement>(null);
  
  const currentSentence = lesson.sentences[currentIdx];

  const playSentence = () => {
    if (videoRef.current && currentSentence) {
      videoRef.current.currentTime = currentSentence.start;
      videoRef.current.play();
    }
  };

  const handleTimeUpdate = () => {
    if (videoRef.current && currentSentence) {
      if (videoRef.current.currentTime >= currentSentence.end) {
        videoRef.current.pause();
      }
    }
  };

  const selectSentence = (idx: number) => {
    setCurrentIdx(idx);
    if (videoRef.current) {
      videoRef.current.currentTime = lesson.sentences[idx].start;
    }
  };

  return (
    <div className="flex h-[calc(100vh-64px)] overflow-hidden bg-slate-50">
      {/* Sidebar */}
      <div className="w-80 bg-white border-r border-slate-200 flex flex-col shadow-sm">
        <div className="p-4 bg-indigo-600 text-white font-bold text-lg">
          Mastery List
        </div>
        <div className="flex-1 overflow-y-auto p-2 space-y-2">
          {lesson.sentences.map((s, i) => (
            <div
              key={i}
              onClick={() => selectSentence(i)}
              className={`p-3 rounded-lg cursor-pointer transition-all border ${
                currentIdx === i
                  ? 'bg-indigo-50 border-indigo-500 shadow-sm'
                  : 'bg-white border-slate-100 hover:bg-slate-50'
              }`}
            >
              <div className="font-bold text-slate-800 line-clamp-1">{s.jp}</div>
              <div className="text-xs text-slate-500 line-clamp-1">{s.vn}</div>
            </div>
          ))}
        </div>
      </div>

      {/* Main Content */}
      <div className="flex-1 flex flex-col p-8 gap-6 overflow-y-auto">
        <div className="w-full max-w-4xl mx-auto aspect-video bg-black rounded-2xl overflow-hidden shadow-2xl">
          <video
            ref={videoRef}
            onTimeUpdate={handleTimeUpdate}
            controls
            className="w-full h-full"
            src={lesson.videoUrl}
          />
        </div>

        <div className="max-w-4xl w-full mx-auto bg-white p-10 rounded-3xl shadow-lg border-b-8 border-indigo-500 text-center space-y-4">
          <div className="text-4xl font-extrabold text-indigo-900 leading-tight">
            {currentSentence?.jp}
          </div>
          <div 
            className={`text-lg text-slate-400 h-8 transition-opacity duration-300 ${showFuri ? 'opacity-100' : 'opacity-0'}`}
          >
            {currentSentence?.furi}
          </div>
          <div className="text-2xl text-rose-500 font-semibold italic">
            {currentSentence?.vn}
          </div>
        </div>

        <div className="flex justify-center gap-4">
          <button
            onClick={playSentence}
            className="flex items-center gap-2 px-8 py-3 bg-indigo-600 text-white rounded-full font-bold shadow-lg hover:bg-indigo-700 hover:scale-105 transition-all"
          >
            <Play size={20} fill="currentColor" /> Nghe & Luyện tập
          </button>
          <button
            onClick={() => setShowFuri(!showFuri)}
            className="flex items-center gap-2 px-6 py-3 bg-slate-200 text-slate-700 rounded-full font-bold hover:bg-slate-300 transition-all"
          >
            {showFuri ? <EyeOff size={20} /> : <Eye size={20} />} 
            {showFuri ? 'Ẩn' : 'Hiện'} Furigana
          </button>
          <button
            onClick={() => videoRef.current?.play()}
            className="flex items-center gap-2 px-6 py-3 bg-slate-200 text-slate-700 rounded-full font-bold hover:bg-slate-300 transition-all"
          >
            <RotateCcw size={20} /> Play tiếp
          </button>
        </div>
      </div>
    </div>
  );
};

export default ShadowingPlayer;
