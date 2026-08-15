import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import PhotoCard from '../components/ui/PhotoCard.jsx';
import Modal from '../components/ui/Modal.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const PhotoWall = () => {
  const nextPage = getNextPage(9);
  const content = CONTENT.photoWall;
  const [selectedPhoto, setSelectedPhoto] = useState(null);
  const [modalOpen, setModalOpen] = useState(false);
  useEffect(() => { document.title = 'Photo Wall 📸'; }, []);
  const handlePhotoClick = (photo) => { setSelectedPhoto(photo); setModalOpen(true); };
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="📷" size="text-5xl" className="absolute -top-4 -right-4" rotate={10} />
      <Sticker emoji="🎀" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-8} />
      <div className="text-center space-y-6 max-w-4xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-3 md:gap-5 w-full">
          {content.photos.map((photo, idx) => (
            <PhotoCard key={idx} src={photo.src} alt={photo.caption} caption={photo.caption} sticker={photo.sticker} rotate={[-3, 2, -1, 4, -2, 3][idx % 6]} onClick={() => handlePhotoClick(photo)} />
          ))}
        </div>
      </div>
      <Modal isOpen={modalOpen} onClose={() => setModalOpen(false)} className="max-w-3xl p-0 overflow-hidden">
        {selectedPhoto && (
          <div className="relative">
            <img src={selectedPhoto.src} alt={selectedPhoto.caption} className="w-full h-auto max-h-[80vh] object-contain" onError={(e) => { e.target.src = ''; e.target.className = 'w-full h-64 flex items-center justify-center text-6xl text-romance-pink'; e.target.innerHTML = '🌸'; }} />
            <div className="p-4 text-center bg-white/90"><p className="text-lg font-serif text-romance-red">{selectedPhoto.caption}</p></div>
          </div>
        )}
      </Modal>
    </PageLayout>
  );
};
export default PhotoWall;
