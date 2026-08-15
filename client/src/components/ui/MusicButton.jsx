import React from 'react';
import { motion } from 'framer-motion';
import { Music, VolumeOff } from 'lucide-react';
import { useMusic } from '../../context/MusicContext.jsx';

const MusicButton = ({ className = '' }) => {
  const { isPlaying, toggleMusic, isAvailable } = useMusic();
  if (!isAvailable) return null;
  return (
    <motion.button
      whileHover={{ scale: 1.1 }}
      whileTap={{ scale: 0.9 }}
      onClick={toggleMusic}
      className={`p-3 rounded-full bg-white/70 backdrop-blur-sm shadow-lg border border-romance-pink/30 hover:bg-white transition-all ${className}`}
      aria-label="Toggle music"
    >
      {isPlaying ? (
        <Music size={22} className="text-romance-red" />
      ) : (
        <VolumeOff size={22} className="text-romance-pink" />
      )}
    </motion.button>
  );
};
export default MusicButton;
