import React from 'react';
import { useNavigate } from 'react-router-dom';
import { motion } from 'framer-motion';
import { Heart } from 'lucide-react';

const NextButton = ({ to, label = 'Continue ❤️', className = '' }) => {
  const navigate = useNavigate();
  return (
    <motion.button
      whileHover={{ scale: 1.05 }}
      whileTap={{ scale: 0.95 }}
      onClick={() => navigate(to)}
      className={`btn-primary ${className}`}
    >
      {label} <Heart size={18} className="inline-block ml-1" />
    </motion.button>
  );
};
export default NextButton;
