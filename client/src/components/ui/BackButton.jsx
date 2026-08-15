import React from 'react';
import { useNavigate } from 'react-router-dom';
import { motion } from 'framer-motion';
import { ArrowLeft } from 'lucide-react';

const BackButton = ({ to, label = '← Back', className = '' }) => {
  const navigate = useNavigate();
  return (
    <motion.button
      whileHover={{ scale: 1.05 }}
      whileTap={{ scale: 0.95 }}
      onClick={() => navigate(to)}
      className={`btn-secondary ${className}`}
    >
      <ArrowLeft size={16} className="inline-block mr-1" /> {label}
    </motion.button>
  );
};
export default BackButton;
