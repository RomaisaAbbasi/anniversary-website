import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';
import { Heart } from 'lucide-react';

const Letter = () => {
  const nextPage = getNextPage(10);
  const content = CONTENT.letter;
  const [isOpen, setIsOpen] = useState(false);
  useEffect(() => { document.title = 'A Letter For You ❤️'; }, []);

  return (
    <PageLayout nextPage={nextPage} nextText={content.buttonNext} showNext={isOpen}>
      <Sticker emoji="💌" size="text-6xl" className="absolute -top-4 -right-4" rotate={15} />
      <Sticker emoji="🌸" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-10} />
      <div className="text-center space-y-6 max-w-2xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <AnimatePresence mode="wait">
          {!isOpen ? (
            <motion.div key="envelope" className="flex flex-col items-center gap-4" initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} exit={{ opacity: 0, scale: 0.8 }}>
              <div className="text-8xl md:text-9xl cursor-pointer hover:scale-110 transition-transform" onClick={() => setIsOpen(true)}>💌</div>
              <motion.button whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }} onClick={() => setIsOpen(true)} className="btn-primary">{content.button}</motion.button>
            </motion.div>
          ) : (
            <motion.div key="letter" className="glass-card p-6 md:p-8 rounded-2xl text-left max-h-[60vh] overflow-y-auto" initial={{ opacity: 0, y: 30, rotateX: 10 }} animate={{ opacity: 1, y: 0, rotateX: 0 }} exit={{ opacity: 0, y: -30 }} transition={{ type: 'spring', damping: 20 }}>
              <div className="prose prose-romance max-w-none">
                {content.content.split('\n').map((line, idx) => <p key={idx} className="text-gray-700 leading-relaxed mb-3 font-serif text-base md:text-lg">{line.trim()}</p>)}
              </div>
              <div className="flex justify-end mt-4"><Heart className="text-romance-red/50" size={24} /></div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </PageLayout>
  );
};
export default Letter;
