import React, { useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import MemoryCard from '../components/ui/MemoryCard.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const Memories = () => {
  const nextPage = getNextPage(5);
  const content = CONTENT.memories;
  useEffect(() => { document.title = 'Our Memories ❤️'; }, []);
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="📷" size="text-5xl" className="absolute -top-4 -right-4" rotate={10} />
      <Sticker emoji="🌸" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-12} />
      <div className="text-center space-y-6 max-w-4xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 md:gap-6 w-full">
          {content.cards.map((card, idx) => (
            <MemoryCard key={idx} title={card.title} description={card.description} date={card.date} image={card.image} sticker={card.sticker} className="hover:shadow-xl" />
          ))}
        </div>
      </div>
    </PageLayout>
  );
};
export default Memories;
