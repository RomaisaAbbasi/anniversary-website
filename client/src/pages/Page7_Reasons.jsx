import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const Reasons = () => {
  const nextPage = getNextPage(7);
  const content = CONTENT.reasons;
  const [openIndex, setOpenIndex] = useState(null);
  useEffect(() => { document.title = 'Reasons I Love You ❤️'; }, []);
  const toggleCard = (idx) => { setOpenIndex(openIndex === idx ? null : idx); };
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="💌" size="text-5xl" className="absolute -top-4 -right-4" rotate={12} />
      <Sticker emoji="🌹" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-10} />
      <div className="text-center space-y-6 max-w-3xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 w-full">
          {content.cards.map((reason, idx) => (
            <motion.div key={idx} className="glass-card p-4 rounded-2xl cursor-pointer hover:shadow-lg transition-all" initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: idx * 0.05 }} onClick={() => toggleCard(idx)}>
              <div className="flex items-center gap-3">
                <div className="text-2xl flex-shrink-0">{openIndex === idx ? '💖' : '💌'}</div>
                <AnimatePresence mode="wait">
                  {openIndex === idx ? (
                    <motion.p key="open" className="text-sm text-gray-700 text-left flex-1" initial={{ opacity: 0, height: 0 }} animate={{ opacity: 1, height: 'auto' }} exit={{ opacity: 0, height: 0 }}>{reason}</motion.p>
                  ) : (
                    <motion.p key="closed" className="text-sm text-gray-500 text-left flex-1 truncate" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}>Click to reveal ❤️</motion.p>
                  )}
                </AnimatePresence>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </PageLayout>
  );
};
export default Reasons;
