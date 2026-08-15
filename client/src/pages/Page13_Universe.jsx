import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const Universe = () => {
  const nextPage = getNextPage(13);
  const content = CONTENT.universe;
  const [starMessages, setStarMessages] = useState([]);
  useEffect(() => {
    document.title = 'Our Little Universe 🌙';
    setStarMessages(content.stars.map((s, i) => ({ ...s, id: i, revealed: false })));
  }, []);
  const toggleStar = (id) => { setStarMessages(stars => stars.map(s => s.id === id ? { ...s, revealed: !s.revealed } : s)); };
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="🌙" size="text-6xl" className="absolute -top-4 -right-4" rotate={10} />
      <Sticker emoji="⭐" size="text-5xl" className="absolute -bottom-2 -left-4" rotate={-8} />
      <div className="text-center space-y-6 max-w-3xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <motion.p className="text-lg md:text-xl text-gray-600 font-serif italic" initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 0.2 }}>"{content.quote}"</motion.p>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-3 w-full">
          {starMessages.map((star, idx) => (
            <motion.div key={star.id} className="glass-card p-4 rounded-2xl cursor-pointer hover:shadow-xl transition-all text-center min-h-[80px] flex items-center justify-center" whileHover={{ scale: 1.05, y: -4 }} initial={{ opacity: 0, scale: 0.8 }} whileInView={{ opacity: 1, scale: 1 }} viewport={{ once: true }} transition={{ delay: idx * 0.08 }} onClick={() => toggleStar(star.id)}>
              <AnimatePresence mode="wait">
                {!star.revealed ? (
                  <motion.div key="star" className="text-4xl" initial={{ scale: 0 }} animate={{ scale: 1 }} exit={{ scale: 0 }}>⭐</motion.div>
                ) : (
                  <motion.p key="message" className="text-sm text-gray-700 font-serif" initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -10 }}>{star.message}</motion.p>
                )}
              </AnimatePresence>
            </motion.div>
          ))}
        </div>
        <p className="text-xs text-gray-400">✨ Click a star to reveal a message ✨</p>
      </div>
    </PageLayout>
  );
};
export default Universe;
