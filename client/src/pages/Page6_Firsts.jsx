import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Modal from '../components/ui/Modal.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';
import { Heart } from 'lucide-react';

const Firsts = () => {
  const nextPage = getNextPage(6);
  const content = CONTENT.firsts;
  const [selectedCard, setSelectedCard] = useState(null);
  const [modalOpen, setModalOpen] = useState(false);
  useEffect(() => { document.title = 'Our Firsts ❤️'; }, []);
  const handleCardClick = (card) => { setSelectedCard(card); setModalOpen(true); };
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="💫" size="text-5xl" className="absolute -top-4 -right-4" rotate={10} />
      <Sticker emoji="🌹" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-8} />
      <div className="text-center space-y-6 max-w-4xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-3 md:gap-4 w-full">
          {content.cards.map((card, idx) => (
            <motion.div key={idx} className="glass-card p-4 md:p-5 rounded-2xl text-center cursor-pointer hover:shadow-xl transition-all" whileHover={{ scale: 1.05, y: -4 }} initial={{ opacity: 0, scale: 0.8 }} whileInView={{ opacity: 1, scale: 1 }} viewport={{ once: true }} transition={{ delay: idx * 0.05 }} onClick={() => handleCardClick(card)}>
              <div className="text-4xl md:text-5xl mb-2">{card.emoji}</div>
              <h3 className="font-serif text-sm md:text-base font-semibold text-romance-red">{card.title}</h3>
            </motion.div>
          ))}
        </div>
      </div>
      <Modal isOpen={modalOpen} onClose={() => setModalOpen(false)}>
        {selectedCard && (<div className="text-center space-y-4"><div className="text-6xl">{selectedCard.emoji}</div><h2 className="text-2xl font-serif text-romance-red font-bold">{selectedCard.title}</h2><p className="text-gray-600 text-lg">{selectedCard.description}</p><Heart className="mx-auto text-romance-red/50" size={32} /></div>)}
      </Modal>
    </PageLayout>
  );
};
export default Firsts;
