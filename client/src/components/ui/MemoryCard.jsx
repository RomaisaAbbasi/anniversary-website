import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Heart } from 'lucide-react';

const MemoryCard = ({ title, description, image, date, sticker, onClick, className = '' }) => {
  const [isHovered, setIsHovered] = useState(false);
  return (
    <motion.div
      className={`relative glass-card p-4 md:p-6 rounded-2xl overflow-hidden cursor-pointer transition-all ${className}`}
      whileHover={{ y: -8, scale: 1.02 }}
      onHoverStart={() => setIsHovered(true)}
      onHoverEnd={() => setIsHovered(false)}
      onClick={onClick}
      initial={{ opacity: 0, y: 30 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true }}
      transition={{ duration: 0.5 }}
    >
      {image && (
        <div className="relative w-full aspect-[4/3] rounded-xl overflow-hidden mb-3 bg-romance-pink/20">
          <img
            src={image}
            alt={title}
            className="w-full h-full object-cover"
            onError={(e) => { e.target.src = ''; e.target.className = 'w-full h-full flex items-center justify-center text-romance-pink text-4xl'; e.target.innerHTML = '🌸'; }}
          />
          {sticker && <div className="absolute -top-2 -right-2 text-3xl">{sticker}</div>}
        </div>
      )}
      <div className="space-y-1">
        <h3 className="font-serif text-lg md:text-xl font-semibold text-romance-red">{title}</h3>
        {date && <p className="text-xs text-romance-pink font-medium">{date}</p>}
        {description && <p className="text-sm text-gray-600 line-clamp-3">{description}</p>}
      </div>
      <AnimatePresence>
        {isHovered && (
          <motion.div className="absolute inset-0 bg-romance-red/5 rounded-2xl flex items-center justify-center" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}>
            <Heart className="text-romance-red/20" size={48} />
          </motion.div>
        )}
      </AnimatePresence>
    </motion.div>
  );
};
export default MemoryCard;
