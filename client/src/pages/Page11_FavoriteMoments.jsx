import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Modal from '../components/ui/Modal.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const FavoriteMoments = () => {
  const nextPage = getNextPage(11);
  const content = CONTENT.favoriteMoments;
  const [selectedCard, setSelectedCard] = useState(null);
  const [modalOpen, setModalOpen] = useState(false);
  useEffect(() => { document.title = 'Favorite Moments ✨'; }, []);
  const handleCardClick = (card) => { setSelectedCard(card); setModalOpen(true); };
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="🌟" size="text-5xl" className="absolute -top-4 -right-4" rotate={10} />
      <Sticker emoji="💕" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-8} />
      <div className="text-center space-y-6 max-w-4xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 w-full">
          {content.cards.map((card, idx) => (
            <motion.div key={idx} className="glass-card p-4 rounded-2xl cursor-pointer hover:shadow-xl transition-all overflow-hidden" whileHover={{ scale: 1.04, y: -4 }} initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: idx * 0.06 }} onClick={() => handleCardClick(card)}>
              <div className="relative w-full aspect-[4/3] rounded-xl overflow-hidden mb-3 bg-romance-pink/10">
                <img src={card.image} alt={card.title} className="w-full h-full object-cover" onError={(e) => { e.target.src = ''; e.target.className = 'w-full h-full flex items-center justify-center text-4xl text-romance-pink'; e.target.innerHTML = '🌸'; }} />
                {card.sticker && <div className="absolute -top-2 -right-2 text-2xl">{card.sticker}</div>}
              </div>
              <h3 className="font-serif text-base md:text-lg font-semibold text-romance-red">{card.title}</h3>
              <p className="text-sm text-gray-500 line-clamp-2">{card.description}</p>
            </motion.div>
          ))}
        </div>
      </div>
      <Modal isOpen={modalOpen} onClose={() => setModalOpen(false)}>
        {selectedCard && (<div className="text-center space-y-4"><div className="text-5xl">{selectedCard.sticker || '💕'}</div><h2 className="text-2xl font-serif text-romance-red font-bold">{selectedCard.title}</h2><p className="text-gray-600 text-lg">{selectedCard.description}</p></div>)}
      </Modal>
    </PageLayout>
  );
};
export default FavoriteMoments;
