import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import Confetti from '../components/ui/Confetti.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';
import { Gift } from 'lucide-react';

const LastSurprise = () => {
  const nextPage = getNextPage(14);
  const content = CONTENT.lastSurprise;
  const [revealed, setRevealed] = useState(false);
  const [showConfetti, setShowConfetti] = useState(false);
  useEffect(() => { document.title = 'One Last Surprise 🎁'; }, []);
  const handleOpen = () => { setRevealed(true); setShowConfetti(true); setTimeout(() => setShowConfetti(false), 5000); };
  return (
    <PageLayout nextPage={nextPage} nextText={content.buttonNext} showNext={revealed}>
      {showConfetti && <Confetti count={150} duration={4500} />}
      <Sticker emoji="🎁" size="text-6xl" className="absolute -top-4 -right-4" rotate={12} />
      <Sticker emoji="💕" size="text-5xl" className="absolute -bottom-2 -left-4" rotate={-10} />
      <div className="text-center space-y-6 max-w-2xl w-full">
        <AnimatePresence mode="wait">
          {!revealed ? (
            <motion.div key="hidden" className="space-y-6" initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} exit={{ opacity: 0, scale: 0.8 }}>
              <h1 className="text-3xl md:text-4xl font-serif text-romance-red font-bold">{content.title}</h1>
              <motion.button whileHover={{ scale: 1.08 }} whileTap={{ scale: 0.95 }} onClick={handleOpen} className="btn-primary text-xl py-5 px-10"><Gift className="mr-2" size={24} />{content.button}</motion.button>
            </motion.div>
          ) : (
            <motion.div key="revealed" className="space-y-6" initial={{ opacity: 0, y: 30 }} animate={{ opacity: 1, y: 0 }} transition={{ type: 'spring', stiffness: 200 }}>
              <div className="text-7xl md:text-8xl">🎉</div>
              <h2 className="text-3xl md:text-5xl font-serif text-romance-red font-bold">Surprise! 💖</h2>
              <div className="glass-card p-6 md:p-8 rounded-2xl space-y-4">
                <p className="text-lg md:text-xl text-gray-700 font-serif leading-relaxed">{content.revealedMessage}</p>
                <p className="text-base md:text-lg text-romance-red font-serif">{content.revealedSub}</p>
              </div>
              <div className="flex justify-center gap-3 text-3xl">
                <span className="heart-beat">❤️</span>
                <span className="animate-float" style={{ animationDelay: '0.3s' }}>💕</span>
                <span className="animate-float" style={{ animationDelay: '0.6s' }}>🌹</span>
                <span className="animate-float" style={{ animationDelay: '0.9s' }}>✨</span>
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </PageLayout>
  );
};
export default LastSurprise;
