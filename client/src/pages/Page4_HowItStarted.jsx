import React, { useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const HowItStarted = () => {
  const nextPage = getNextPage(4);
  const content = CONTENT.howItStarted;
  useEffect(() => { document.title = 'How It All Started ❤️'; }, []);
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="💌" size="text-5xl" className="absolute -top-4 -right-4" rotate={12} />
      <Sticker emoji="🌸" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-8} />
      <div className="text-center space-y-6 max-w-3xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <div className="space-y-4 w-full">
          {content.timeline.map((item, idx) => (
            <motion.div key={idx} className="glass-card p-4 md:p-5 rounded-2xl flex items-start gap-4 text-left hover:shadow-lg transition-all" initial={{ opacity: 0, x: idx % 2 === 0 ? -30 : 30 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }} transition={{ delay: idx * 0.1 }}>
              <div className="flex-shrink-0 text-3xl mt-1">{item.sticker || '💕'}</div>
              <div><h3 className="font-serif text-lg md:text-xl text-romance-red font-semibold">{item.title}</h3><p className="text-sm text-gray-500">{item.date}</p><p className="text-gray-600 mt-1">{item.description}</p></div>
            </motion.div>
          ))}
        </div>
      </div>
    </PageLayout>
  );
};
export default HowItStarted;
