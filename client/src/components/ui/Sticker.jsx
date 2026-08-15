import React from 'react';
import { motion } from 'framer-motion';

const Sticker = ({ emoji, size = 'text-4xl', className = '', float = true, delay = 0, rotate = 0, x = 0, y = 0 }) => {
  return (
    <motion.div
      className={`select-none pointer-events-none ${float ? 'sticker-float' : ''} ${className}`}
      style={{ fontSize: size, transform: `rotate(${rotate}deg) translate(${x}px, ${y}px)`, animationDelay: `${delay}s` }}
      initial={{ scale: 0, opacity: 0 }}
      animate={{ scale: 1, opacity: 1 }}
      transition={{ delay: delay + 0.2, type: 'spring', stiffness: 200 }}
    >
      {emoji}
    </motion.div>
  );
};
export default Sticker;
