import React from 'react';
import { motion } from 'framer-motion';

const PhotoCard = ({ src, alt, caption, date, className = '', onClick, rotate = 0, sticker }) => {
  return (
    <motion.div
      className={`relative glass-card p-3 rounded-2xl shadow-md hover:shadow-xl transition-all cursor-pointer ${className}`}
      style={{ transform: `rotate(${rotate}deg)` }}
      whileHover={{ scale: 1.05, rotate: 0 }}
      onClick={onClick}
      initial={{ opacity: 0, scale: 0.9 }}
      whileInView={{ opacity: 1, scale: 1 }}
      viewport={{ once: true }}
      transition={{ duration: 0.4 }}
    >
      <div className="relative w-full aspect-square rounded-xl overflow-hidden bg-romance-pink/10">
        <img
          src={src}
          alt={alt || 'Memory photo'}
          className="w-full h-full object-cover"
          onError={(e) => { e.target.src = ''; e.target.className = 'w-full h-full flex items-center justify-center text-4xl text-romance-pink'; e.target.innerHTML = '🌸'; }}
        />
        {sticker && <div className="absolute -top-2 -right-2 text-2xl">{sticker}</div>}
      </div>
      {caption && (
        <div className="mt-2 text-center">
          <p className="text-sm font-medium text-gray-700">{caption}</p>
          {date && <p className="text-xs text-romance-pink">{date}</p>}
        </div>
      )}
    </motion.div>
  );
};
export default PhotoCard;
