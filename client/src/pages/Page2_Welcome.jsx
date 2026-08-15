import React, { useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const Welcome = () => {
  const nextPage = getNextPage(2);
  const content = CONTENT.welcome;
  useEffect(() => { document.title = 'Welcome ❤️ John & Jane'; }, []);
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="💕" size="text-5xl" className="absolute -top-4 -left-4" rotate={-15} />
      <Sticker emoji="🌸" size="text-4xl" className="absolute -bottom-2 -right-2" rotate={12} />
      <div className="text-center space-y-6 max-w-2xl">
        <motion.div initial={{ scale: 0 }} animate={{ scale: 1 }} transition={{ type: 'spring', stiffness: 200, delay: 0.2 }}><span className="text-7xl md:text-8xl inline-block">💑</span></motion.div>
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }}>{content.title}</motion.h1>
        <motion.p className="text-lg md:text-xl text-gray-600 font-serif" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.5 }}>{content.subtitle}</motion.p>
        <motion.div className="bg-romance-red/5 rounded-2xl p-6 border border-romance-pink/20" initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} transition={{ delay: 0.6 }}>
          <p className="text-xl md:text-2xl font-serif text-romance-red">{content.anniversary}</p>
        </motion.div>
        <motion.div className="flex justify-center gap-4 flex-wrap mt-4" initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 0.8 }}>
          <span className="text-3xl animate-float" style={{ animationDelay: '0s' }}>💖</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '0.5s' }}>✨</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '1s' }}>🌹</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '1.5s' }}>💕</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '2s' }}>🌟</span>
        </motion.div>
      </div>
    </PageLayout>
  );
};
export default Welcome;
