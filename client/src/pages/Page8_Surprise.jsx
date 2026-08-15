import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const Surprise = () => {
  const nextPage = getNextPage(8);
  const content = CONTENT.surprise;
  const [revealed, setRevealed] = useState(false);
  const [noClicks, setNoClicks] = useState(0);
  const [noMessage, setNoMessage] = useState('');
  const [buttonPosition, setButtonPosition] = useState({ x: 0, y: 0 });
  const navigate = useNavigate();
  useEffect(() => { document.title = 'Little Surprise ❤️'; }, []);

  const handleYes = () => setRevealed(true);
  const handleNo = () => {
    const clicks = noClicks + 1;
    setNoClicks(clicks);
    if (clicks === 1) { setNoMessage(content.noResponse); setButtonPosition({ x: (Math.random() - 0.5) * 60, y: (Math.random() - 0.5) * 60 }); }
    else if (clicks === 2) { setNoMessage(content.noResponseSub); setButtonPosition({ x: (Math.random() - 0.5) * 100, y: (Math.random() - 0.5) * 100 }); }
    else { setNoMessage('Come on, just say YES! 🥺❤️'); setButtonPosition({ x: (Math.random() - 0.5) * 120, y: (Math.random() - 0.5) * 120 }); }
  };
  const handleContinue = () => navigate(nextPage);

  return (
    <div className="page-container relative min-h-screen">
      <Sticker emoji="🎁" size="text-6xl" className="absolute -top-4 -right-4" rotate={12} />
      <Sticker emoji="💕" size="text-5xl" className="absolute -bottom-2 -left-4" rotate={-8} />
      <div className="relative z-10 w-full max-w-2xl mx-auto flex-1 flex flex-col items-center justify-center px-4 py-8">
        <AnimatePresence mode="wait">
          {!revealed ? (
            <motion.div key="question" className="text-center space-y-6 w-full" initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} exit={{ opacity: 0, scale: 0.8 }}>
              <h1 className="text-3xl md:text-4xl font-serif text-romance-red font-bold">{content.title}</h1>
              <p className="text-xl md:text-2xl text-gray-600">{content.subtitle}</p>
              <div className="flex justify-center gap-6 mt-6 flex-wrap">
                <motion.button whileHover={{ scale: 1.08 }} whileTap={{ scale: 0.95 }} onClick={handleYes} className="px-8 py-4 bg-romance-red text-white rounded-full text-lg font-semibold shadow-lg hover:shadow-xl transition-all">{content.yesText}</motion.button>
                <motion.button whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }} onClick={handleNo} className="px-8 py-4 bg-romance-pink/30 text-romance-red rounded-full text-lg font-semibold border border-romance-pink/50 transition-all" style={{ transform: `translate(${buttonPosition.x}px, ${buttonPosition.y}px)` }}>{content.noText}</motion.button>
              </div>
              {noMessage && <motion.p className="text-romance-red text-lg font-serif mt-4" initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }}>{noMessage}</motion.p>}
            </motion.div>
          ) : (
            <motion.div key="revealed" className="text-center space-y-6 w-full" initial={{ opacity: 0, scale: 0.8, y: 20 }} animate={{ opacity: 1, scale: 1, y: 0 }} transition={{ type: 'spring', stiffness: 200 }}>
              <div className="text-7xl md:text-8xl">🎉</div>
              <h2 className="text-3xl md:text-4xl font-serif text-romance-red font-bold">Surprise! ❤️</h2>
              <p className="text-lg md:text-xl text-gray-700 max-w-lg mx-auto">{content.revealedMessage}</p>
              <div className="flex justify-center gap-3 text-3xl">
                <span className="heart-beat">❤️</span>
                <span className="animate-float" style={{ animationDelay: '0.3s' }}>💕</span>
                <span className="animate-float" style={{ animationDelay: '0.6s' }}>✨</span>
                <span className="animate-float" style={{ animationDelay: '0.9s' }}>🌹</span>
              </div>
              <motion.button whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }} onClick={handleContinue} className="btn-primary mt-4">{content.button}</motion.button>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </div>
  );
};
export default Surprise;
