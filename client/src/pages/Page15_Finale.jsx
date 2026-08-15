import React, { useEffect, useState } from 'react';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import Sticker from '../components/ui/Sticker.jsx';
import Confetti from '../components/ui/Confetti.jsx';
import { CONTENT } from '../data/content.js';
import { Sparkles } from 'lucide-react';

const Finale = () => {
  const content = CONTENT.finale;
  const navigate = useNavigate();
  const [showConfetti, setShowConfetti] = useState(true);
  useEffect(() => {
    document.title = 'Anniversary Finale ❤️';
    const timer = setTimeout(() => setShowConfetti(false), 6000);
    return () => clearTimeout(timer);
  }, []);
  const handleReplay = () => navigate('/page/2');
  return (
    <div className="page-container relative min-h-screen bg-gradient-to-b from-romance-red/5 via-romance-cream to-romance-pink/20">
      {showConfetti && <Confetti count={200} duration={5000} />}
      <Sticker emoji="💍" size="text-6xl" className="absolute top-8 right-8" rotate={15} />
      <Sticker emoji="🌹" size="text-5xl" className="absolute bottom-8 left-8" rotate={-10} />
      <Sticker emoji="💕" size="text-5xl" className="absolute top-1/3 left-4" rotate={20} />
      <div className="relative z-10 w-full max-w-3xl mx-auto flex-1 flex flex-col items-center justify-center px-4 py-8 text-center space-y-6">
        <motion.div initial={{ scale: 0 }} animate={{ scale: 1 }} transition={{ type: 'spring', stiffness: 200, delay: 0.2 }} className="text-7xl md:text-8xl">💑</motion.div>
        <motion.h1 className="text-4xl md:text-6xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }}>{content.title}</motion.h1>
        <motion.div className="space-y-4 max-w-xl" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.5 }}>
          <p className="text-xl md:text-2xl text-gray-700 font-serif leading-relaxed">{content.message}</p>
        </motion.div>
        <motion.div className="glass-card p-6 md:p-8 rounded-2xl border border-romance-gold/30 bg-white/80" initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} transition={{ delay: 0.7 }}>
          <p className="text-2xl md:text-3xl font-serif text-romance-red font-bold">{content.anniversary}</p>
          <div className="flex justify-center gap-4 mt-4 text-3xl"><span className="heart-beat">❤️</span><span>💍</span><span className="heart-beat" style={{ animationDelay: '0.3s' }}>❤️</span></div>
        </motion.div>
        <motion.div className="flex justify-center gap-4 flex-wrap" initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 0.9 }}>
          <span className="text-3xl animate-float" style={{ animationDelay: '0s' }}>🌹</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '0.5s' }}>💕</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '1s' }}>✨</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '1.5s' }}>🌸</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '2s' }}>🌟</span>
        </motion.div>
        <motion.p className="text-2xl md:text-3xl font-serif text-romance-red font-bold" initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 1.1 }}>{content.forever}</motion.p>
        <motion.button whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }} onClick={handleReplay} className="btn-primary mt-4" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 1.3 }}><Sparkles size={18} className="mr-2" />{content.button}</motion.button>
        <motion.p className="text-xs text-gray-400 mt-8" initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 1.5 }}>Made with infinite love for John ❤️ Jane</motion.p>
      </div>
    </div>
  );
};
export default Finale;
