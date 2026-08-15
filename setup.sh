#!/bin/bash

# ================================================================
#  ANNIVERSARY WEBSITE SETUP SCRIPT
#  Run: bash setup.sh
# ================================================================

set -e  # stop on error

# ---- Create root directories ----
mkdir -p client/public/{music,images}
mkdir -p client/src/{components/ui,pages,data,context,styles}
mkdir -p server/src/{controllers,routes,middleware,config}

# ================================================================
#  ROOT FILES
# ================================================================

# Root package.json
cat > package.json << 'EOF'
{
  "name": "anniversary-website",
  "version": "1.0.0",
  "description": "Private Wedding Anniversary Website for Taimoor ❤️ Hoorain",
  "scripts": {
    "dev": "concurrently \"npm run dev:client\" \"npm run dev:server\"",
    "dev:client": "cd client && npm run dev",
    "dev:server": "cd server && npm run dev",
    "install:all": "npm install && cd client && npm install && cd ../server && npm install",
    "build": "cd client && npm run build"
  },
  "devDependencies": {
    "concurrently": "^8.2.2"
  }
}
EOF

# README.md
cat > README.md << 'EOF'
# Taimoor ❤️ Hoorain — Anniversary Website

A private, beautiful, and interactive 15-page wedding anniversary website.

## Setup

1. Run `npm run install:all` to install dependencies.
2. Edit `server/.env` to set username/password.
3. Add photos to `client/public/images/` and music to `client/public/music/`.
4. Run `npm run dev` to start both client and server.
5. Deploy: Frontend to Vercel (static), backend to any Node hosting (or use Vercel serverless).
EOF

# ================================================================
#  CLIENT FILES
# ================================================================

# client/package.json
cat > client/package.json << 'EOF'
{
  "name": "anniversary-client",
  "private": true,
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "axios": "^1.6.0",
    "framer-motion": "^11.0.0",
    "lucide-react": "^0.344.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.20.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.43",
    "@types/react-dom": "^18.2.17",
    "@vitejs/plugin-react": "^4.2.1",
    "autoprefixer": "^10.4.16",
    "postcss": "^8.4.32",
    "tailwindcss": "^3.3.6",
    "vite": "^5.0.8"
  }
}
EOF

# client/index.html
cat > client/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Taimoor ❤️ Hoorain — Anniversary</title>
    <style>
      * { margin: 0; padding: 0; box-sizing: border-box; }
      body { font-family: system-ui, sans-serif; background: #fdf6f0; min-height: 100vh; }
      #root { min-height: 100vh; }
    </style>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>
EOF

# client/vite.config.js
cat > client/vite.config.js << 'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    proxy: {
      '/api': {
        target: 'http://localhost:5000',
        changeOrigin: true,
      },
    },
  },
})
EOF

# client/tailwind.config.js
cat > client/tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        romance: {
          red: '#b22234',
          pink: '#f8a4b8',
          cream: '#fdf6f0',
          gold: '#c9a84c',
          rose: '#e87a8a',
          blush: '#fce4ec',
        },
      },
      fontFamily: {
        serif: ['Georgia', 'serif'],
        script: ['"Brush Script MT"', 'cursive'],
      },
      animation: {
        'float': 'float 3s ease-in-out infinite',
        'float-slow': 'float 6s ease-in-out infinite',
        'pulse-soft': 'pulseSoft 2s ease-in-out infinite',
        'sparkle': 'sparkle 1.5s ease-in-out infinite',
        'confetti-fall': 'confettiFall 4s linear infinite',
        'heart-beat': 'heartBeat 1.2s ease-in-out infinite',
        'fade-in-up': 'fadeInUp 0.8s ease-out',
        'fade-in': 'fadeIn 0.6s ease-out',
        'slide-up': 'slideUp 0.7s ease-out',
        'envelope-open': 'envelopeOpen 0.8s ease-out',
      },
      keyframes: {
        float: {
          '0%,100%': { transform: 'translateY(0px)' },
          '50%': { transform: 'translateY(-16px)' },
        },
        pulseSoft: {
          '0%,100%': { opacity: 1 },
          '50%': { opacity: 0.6 },
        },
        sparkle: {
          '0%,100%': { transform: 'scale(1)', opacity: 1 },
          '50%': { transform: 'scale(1.4)', opacity: 0.7 },
        },
        confettiFall: {
          '0%': { transform: 'translateY(-10vh) rotate(0deg)', opacity: 1 },
          '100%': { transform: 'translateY(110vh) rotate(720deg)', opacity: 0 },
        },
        heartBeat: {
          '0%,100%': { transform: 'scale(1)' },
          '14%': { transform: 'scale(1.2)' },
          '28%': { transform: 'scale(1)' },
          '42%': { transform: 'scale(1.15)' },
          '70%': { transform: 'scale(1)' },
        },
        fadeInUp: {
          '0%': { opacity: 0, transform: 'translateY(30px)' },
          '100%': { opacity: 1, transform: 'translateY(0)' },
        },
        fadeIn: {
          '0%': { opacity: 0 },
          '100%': { opacity: 1 },
        },
        slideUp: {
          '0%': { opacity: 0, transform: 'translateY(60px)' },
          '100%': { opacity: 1, transform: 'translateY(0)' },
        },
        envelopeOpen: {
          '0%': { transform: 'scale(0.9)', opacity: 0 },
          '50%': { transform: 'scale(1.05)' },
          '100%': { transform: 'scale(1)', opacity: 1 },
        },
      },
    },
  },
  plugins: [],
}
EOF

# client/postcss.config.js
cat > client/postcss.config.js << 'EOF'
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# client/src/styles/index.css
cat > client/src/styles/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  html { scroll-behavior: smooth; }
  body {
    @apply bg-romance-cream min-h-screen overflow-x-hidden;
    font-family: system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;
  }
  ::-webkit-scrollbar { width: 6px; }
  ::-webkit-scrollbar-track { @apply bg-romance-cream; }
  ::-webkit-scrollbar-thumb { @apply bg-romance-pink rounded-full; }
}
@layer components {
  .page-container {
    @apply min-h-screen w-full px-4 py-8 md:px-8 lg:px-16 flex flex-col items-center justify-center;
    background: linear-gradient(180deg, #fdf6f0 0%, #fce4ec 100%);
  }
  .glass-card {
    @apply bg-white/80 backdrop-blur-sm rounded-3xl shadow-xl border border-white/50;
  }
  .btn-primary {
    @apply px-8 py-3 md:px-10 md:py-4 bg-romance-red text-white rounded-full
    font-semibold text-base md:text-lg shadow-lg hover:shadow-xl
    transition-all duration-300 hover:scale-105 active:scale-95
    flex items-center justify-center gap-2;
  }
  .btn-secondary {
    @apply px-6 py-2.5 md:px-8 md:py-3 bg-romance-pink/30 text-romance-red
    rounded-full font-medium text-sm md:text-base
    border border-romance-pink/50 hover:bg-romance-pink/50
    transition-all duration-300 hover:scale-105 active:scale-95;
  }
  .sticker-float {
    @apply absolute select-none pointer-events-none;
    animation: float 4s ease-in-out infinite;
  }
}
.floating-heart {
  position: fixed;
  pointer-events: none;
  font-size: 1.2rem;
  opacity: 0.35;
  animation: floatHeart linear infinite;
  z-index: 0;
}
@keyframes floatHeart {
  0% { transform: translateY(100vh) scale(0.5) rotate(0deg); opacity: 0; }
  10% { opacity: 0.35; }
  90% { opacity: 0.35; }
  100% { transform: translateY(-10vh) scale(1.2) rotate(720deg); opacity: 0; }
}
.confetti-piece {
  position: fixed;
  pointer-events: none;
  width: 10px;
  height: 10px;
  border-radius: 2px;
  animation: confettiFall linear forwards;
  z-index: 9999;
}
@keyframes confettiFall {
  0% { opacity: 1; transform: translateY(-20px) rotate(0deg) scale(1); }
  100% { opacity: 0; transform: translateY(100vh) rotate(720deg) scale(0.3); }
}
.heart-beat { animation: heartBeat 1.2s ease-in-out infinite; }
@keyframes heartBeat {
  0%,100% { transform: scale(1); }
  14% { transform: scale(1.25); }
  28% { transform: scale(1); }
  42% { transform: scale(1.2); }
  70% { transform: scale(1); }
}
EOF

# client/src/main.jsx
cat > client/src/main.jsx << 'EOF'
import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import App from './App.jsx';
import './styles/index.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </React.StrictMode>
);
EOF

# client/src/App.jsx
cat > client/src/App.jsx << 'EOF'
import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { ProtectedRoute } from './components/ui/ProtectedRoute.jsx';
import Login from './pages/Page1_Login.jsx';
import Welcome from './pages/Page2_Welcome.jsx';
import Anniversary from './pages/Page3_Anniversary.jsx';
import HowItStarted from './pages/Page4_HowItStarted.jsx';
import Memories from './pages/Page5_Memories.jsx';
import Firsts from './pages/Page6_Firsts.jsx';
import Reasons from './pages/Page7_Reasons.jsx';
import Surprise from './pages/Page8_Surprise.jsx';
import PhotoWall from './pages/Page9_PhotoWall.jsx';
import Letter from './pages/Page10_Letter.jsx';
import FavoriteMoments from './pages/Page11_FavoriteMoments.jsx';
import BucketList from './pages/Page12_BucketList.jsx';
import Universe from './pages/Page13_Universe.jsx';
import LastSurprise from './pages/Page14_LastSurprise.jsx';
import Finale from './pages/Page15_Finale.jsx';
import { MusicProvider } from './context/MusicContext.jsx';

function App() {
  return (
    <MusicProvider>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route element={<ProtectedRoute />}>
          <Route path="/" element={<Navigate to="/page/2" replace />} />
          <Route path="/page/2" element={<Welcome />} />
          <Route path="/page/3" element={<Anniversary />} />
          <Route path="/page/4" element={<HowItStarted />} />
          <Route path="/page/5" element={<Memories />} />
          <Route path="/page/6" element={<Firsts />} />
          <Route path="/page/7" element={<Reasons />} />
          <Route path="/page/8" element={<Surprise />} />
          <Route path="/page/9" element={<PhotoWall />} />
          <Route path="/page/10" element={<Letter />} />
          <Route path="/page/11" element={<FavoriteMoments />} />
          <Route path="/page/12" element={<BucketList />} />
          <Route path="/page/13" element={<Universe />} />
          <Route path="/page/14" element={<LastSurprise />} />
          <Route path="/page/15" element={<Finale />} />
          <Route path="*" element={<Navigate to="/page/2" replace />} />
        </Route>
      </Routes>
    </MusicProvider>
  );
}
export default App;
EOF

# client/src/context/MusicContext.jsx
cat > client/src/context/MusicContext.jsx << 'EOF'
import React, { createContext, useState, useContext, useRef, useEffect } from 'react';

const MusicContext = createContext();

export const MusicProvider = ({ children }) => {
  const [isPlaying, setIsPlaying] = useState(false);
  const [isAvailable, setIsAvailable] = useState(true);
  const audioRef = useRef(null);

  useEffect(() => {
    try {
      const audio = new Audio('/music/romantic.mp3');
      audio.loop = true;
      audio.volume = 0.4;
      audioRef.current = audio;
      audio.addEventListener('canplaythrough', () => setIsAvailable(true));
      audio.addEventListener('error', () => setIsAvailable(false));
    } catch (e) {
      setIsAvailable(false);
    }
    return () => {
      if (audioRef.current) {
        audioRef.current.pause();
        audioRef.current = null;
      }
    };
  }, []);

  const toggleMusic = () => {
    if (!audioRef.current || !isAvailable) return;
    if (isPlaying) {
      audioRef.current.pause();
      setIsPlaying(false);
    } else {
      audioRef.current.play().catch(() => setIsAvailable(false));
      setIsPlaying(true);
    }
  };

  return (
    <MusicContext.Provider value={{ isPlaying, toggleMusic, isAvailable }}>
      {children}
    </MusicContext.Provider>
  );
};

export const useMusic = () => useContext(MusicContext);
EOF

# ----- components/ui -----

# ProtectedRoute
cat > client/src/components/ui/ProtectedRoute.jsx << 'EOF'
import React from 'react';
import { Navigate, Outlet } from 'react-router-dom';

export const ProtectedRoute = () => {
  const token = localStorage.getItem('anniversary_token');
  if (!token) return <Navigate to="/login" replace />;
  try {
    const parts = token.split('.');
    if (parts.length !== 3) throw new Error('Invalid token');
    return <Outlet />;
  } catch (e) {
    localStorage.removeItem('anniversary_token');
    return <Navigate to="/login" replace />;
  }
};
EOF

# PageLayout
cat > client/src/components/ui/PageLayout.jsx << 'EOF'
import React from 'react';
import { motion } from 'framer-motion';
import NextButton from './NextButton.jsx';
import BackButton from './BackButton.jsx';
import MusicButton from './MusicButton.jsx';
import FloatingHearts from './FloatingHearts.jsx';

const PageLayout = ({
  children,
  nextPage,
  prevPage,
  showNext = true,
  showBack = false,
  nextText = 'Continue ❤️',
  className = '',
  noHearts = false,
}) => {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      exit={{ opacity: 0, y: -20 }}
      transition={{ duration: 0.5, ease: 'easeOut' }}
      className={`page-container relative ${className}`}
    >
      {!noHearts && <FloatingHearts count={18} />}
      <div className="absolute top-4 right-4 z-20"><MusicButton /></div>
      <div className="relative z-10 w-full max-w-4xl mx-auto flex-1 flex flex-col items-center justify-center py-6">
        {children}
      </div>
      <div className="relative z-10 w-full max-w-4xl mx-auto flex items-center justify-between px-4 pb-4 mt-4">
        <div>
          {showBack && prevPage && <BackButton to={prevPage} label="← Back" />}
        </div>
        <div>
          {showNext && nextPage && <NextButton to={nextPage} label={nextText} />}
        </div>
      </div>
    </motion.div>
  );
};
export default PageLayout;
EOF

# NextButton
cat > client/src/components/ui/NextButton.jsx << 'EOF'
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
EOF

# BackButton
cat > client/src/components/ui/BackButton.jsx << 'EOF'
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
EOF

# MusicButton
cat > client/src/components/ui/MusicButton.jsx << 'EOF'
import React from 'react';
import { motion } from 'framer-motion';
import { Music, Music2Off } from 'lucide-react';
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
    >
      {isPlaying ? <Music size={22} className="text-romance-red" /> : <Music2Off size={22} className="text-romance-pink" />}
    </motion.button>
  );
};
export default MusicButton;
EOF

# FloatingHearts
cat > client/src/components/ui/FloatingHearts.jsx << 'EOF'
import React, { useEffect, useState } from 'react';
import { createPortal } from 'react-dom';

const FloatingHearts = ({ count = 20 }) => {
  const [hearts, setHearts] = useState([]);
  useEffect(() => {
    const emojis = ['❤️', '💗', '💖', '💕', '✨', '🌸'];
    const newHearts = [];
    for (let i = 0; i < count; i++) {
      const size = 0.6 + Math.random() * 1.2;
      const duration = 12 + Math.random() * 18;
      const delay = Math.random() * 20;
      const left = Math.random() * 100;
      const emoji = emojis[Math.floor(Math.random() * emojis.length)];
      newHearts.push({ id: i, emoji, size, duration, delay, left });
    }
    setHearts(newHearts);
  }, [count]);
  return createPortal(
    <div className="fixed inset-0 pointer-events-none overflow-hidden z-0">
      {hearts.map((h) => (
        <div
          key={h.id}
          className="floating-heart"
          style={{
            left: `${h.left}%`,
            fontSize: `${h.size}rem`,
            animationDuration: `${h.duration}s`,
            animationDelay: `${h.delay}s`,
          }}
        >
          {h.emoji}
        </div>
      ))}
    </div>,
    document.body
  );
};
export default FloatingHearts;
EOF

# Sticker
cat > client/src/components/ui/Sticker.jsx << 'EOF'
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
EOF

# MemoryCard
cat > client/src/components/ui/MemoryCard.jsx << 'EOF'
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
EOF

# PhotoCard
cat > client/src/components/ui/PhotoCard.jsx << 'EOF'
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
EOF

# Modal
cat > client/src/components/ui/Modal.jsx << 'EOF'
import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { X } from 'lucide-react';

const Modal = ({ isOpen, onClose, children, className = '' }) => {
  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div className="fixed inset-0 z-50 flex items-center justify-center p-4" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}>
          <motion.div className="absolute inset-0 bg-black/40 backdrop-blur-sm" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} onClick={onClose} />
          <motion.div
            className={`relative glass-card max-w-lg w-full max-h-[90vh] overflow-y-auto p-6 md:p-8 rounded-3xl ${className}`}
            initial={{ scale: 0.8, y: 40, opacity: 0 }}
            animate={{ scale: 1, y: 0, opacity: 1 }}
            exit={{ scale: 0.8, y: 40, opacity: 0 }}
            transition={{ type: 'spring', damping: 25 }}
          >
            <button onClick={onClose} className="absolute top-3 right-3 p-2 rounded-full hover:bg-romance-pink/20 transition-colors">
              <X size={20} className="text-romance-red" />
            </button>
            {children}
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
};
export default Modal;
EOF

# Confetti
cat > client/src/components/ui/Confetti.jsx << 'EOF'
import React, { useEffect, useState } from 'react';
import { createPortal } from 'react-dom';

const Confetti = ({ count = 120, duration = 4000, onComplete }) => {
  const [pieces, setPieces] = useState([]);
  useEffect(() => {
    const colors = ['#b22234', '#f8a4b8', '#c9a84c', '#ff6b8a', '#ffb3c6', '#ffd700'];
    const newPieces = [];
    for (let i = 0; i < count; i++) {
      const size = 6 + Math.random() * 10;
      const left = Math.random() * 100;
      const delay = Math.random() * 2;
      const duration = 3 + Math.random() * 3;
      const color = colors[Math.floor(Math.random() * colors.length)];
      const rotate = Math.random() * 720;
      newPieces.push({ id: i, size, left, delay, duration, color, rotate });
    }
    setPieces(newPieces);
    const timer = setTimeout(() => { setPieces([]); if (onComplete) onComplete(); }, duration);
    return () => clearTimeout(timer);
  }, [count, duration, onComplete]);
  if (pieces.length === 0) return null;
  return createPortal(
    <div className="fixed inset-0 pointer-events-none z-50 overflow-hidden">
      {pieces.map((p) => (
        <div
          key={p.id}
          className="confetti-piece"
          style={{
            left: `${p.left}%`,
            width: `${p.size}px`,
            height: `${p.size * 0.6}px`,
            backgroundColor: p.color,
            animationDuration: `${p.duration}s`,
            animationDelay: `${p.delay}s`,
            transform: `rotate(${p.rotate}deg)`,
          }}
        />
      ))}
    </div>,
    document.body
  );
};
export default Confetti;
EOF

# ----- data files -----

# config.js
cat > client/src/data/config.js << 'EOF'
export const CONFIG = {
  partner1: 'Taimoor',
  partner2: 'Hoorain',
  anniversaryDate: '2023-06-15',
  loginHint: 'Username: taimoor | Password: loveforever',
  musicFile: '/music/romantic.mp3',
  defaultImage: '/images/placeholder.jpg',
  defaultCoupleSticker: '💑',
  defaultRingSticker: '💍',
  colors: {
    primary: 'romance-red',
    secondary: 'romance-pink',
    accent: 'romance-gold',
    bg: 'romance-cream',
    white: 'white',
  },
  pageTitles: {
    2: 'Welcome ❤️',
    3: 'Our Special Day',
    4: 'How It All Started',
    5: 'Our Memories',
    6: 'Our Firsts',
    7: 'Reasons I Love You',
    8: 'Little Surprise',
    9: 'Photo Wall',
    10: 'A Letter For You',
    11: 'Favorite Moments',
    12: 'Bucket List',
    13: 'Our Little Universe',
    14: 'One Last Surprise',
    15: 'Anniversary Finale',
  },
};
export default CONFIG;
EOF

# pagesConfig.js
cat > client/src/data/pagesConfig.js << 'EOF'
export const pagesConfig = [
  { id: 2, path: '/page/2', component: 'Welcome', label: 'Welcome' },
  { id: 3, path: '/page/3', component: 'Anniversary', label: 'Our Special Day' },
  { id: 4, path: '/page/4', component: 'HowItStarted', label: 'How It All Started' },
  { id: 5, path: '/page/5', component: 'Memories', label: 'Our Memories' },
  { id: 6, path: '/page/6', component: 'Firsts', label: 'Our Firsts' },
  { id: 7, path: '/page/7', component: 'Reasons', label: 'Reasons I Love You' },
  { id: 8, path: '/page/8', component: 'Surprise', label: 'Little Surprise' },
  { id: 9, path: '/page/9', component: 'PhotoWall', label: 'Photo Wall' },
  { id: 10, path: '/page/10', component: 'Letter', label: 'A Letter For You' },
  { id: 11, path: '/page/11', component: 'FavoriteMoments', label: 'Favorite Moments' },
  { id: 12, path: '/page/12', component: 'BucketList', label: 'Bucket List' },
  { id: 13, path: '/page/13', component: 'Universe', label: 'Our Little Universe' },
  { id: 14, path: '/page/14', component: 'LastSurprise', label: 'One Last Surprise' },
  { id: 15, path: '/page/15', component: 'Finale', label: 'Anniversary Finale' },
];
export const getNextPage = (currentId) => {
  const index = pagesConfig.findIndex(p => p.id === currentId);
  if (index === -1 || index === pagesConfig.length - 1) return null;
  return pagesConfig[index + 1].path;
};
export const getPrevPage = (currentId) => {
  const index = pagesConfig.findIndex(p => p.id === currentId);
  if (index <= 0) return null;
  return pagesConfig[index - 1].path;
};
export default pagesConfig;
EOF

# content.js
cat > client/src/data/content.js << 'EOF'
import CONFIG from './config.js';
const { partner1, partner2, anniversaryDate } = CONFIG;

export const CONTENT = {
  welcome: {
    title: `Hey ${partner1} ❤️`,
    subtitle: 'Welcome to a little world made just for us.',
    anniversary: `Happy Wedding Anniversary, ${partner1} & ${partner2} 💍❤️`,
    button: "Let's Begin Our Story →",
  },
  anniversary: {
    title: 'Our Beautiful Journey ❤️',
    togetherSince: `Together since ${anniversaryDate}`,
    years: 'Years', months: 'Months', days: 'Days', hours: 'Hours', minutes: 'Minutes', seconds: 'Seconds',
    button: 'Continue to Our Story →',
  },
  howItStarted: {
    title: 'How It All Started...',
    timeline: [
      { title: 'First Meeting', description: 'The moment our eyes met, something magical happened.', date: 'June 15, 2023', sticker: '👀' },
      { title: 'First Conversation', description: 'We talked for hours and it felt like minutes.', date: 'June 16, 2023', sticker: '💬' },
      { title: 'First Picture Together', description: 'A photo that captured the beginning of our story.', date: 'June 20, 2023', sticker: '📸' },
      { title: 'First Special Day', description: 'The day we knew this was something extraordinary.', date: 'July 1, 2023', sticker: '🌟' },
    ],
    button: 'Continue to Memories →',
  },
  memories: {
    title: 'Our Memories ❤️',
    cards: [
      { title: 'First Date', description: 'A beautiful evening we\'ll never forget.', date: 'June 2023', image: '/images/memory-1.jpg', sticker: '🌸' },
      { title: 'Our First Trip', description: 'Exploring new places together.', date: 'July 2023', image: '/images/memory-2.jpg', sticker: '✈️' },
      { title: 'Lazy Sundays', description: 'The best days are the ones spent with you.', date: 'August 2023', image: '/images/memory-3.jpg', sticker: '☕' },
      { title: 'Celebrating Love', description: 'Every day with you is a celebration.', date: 'September 2023', image: '/images/memory-4.jpg', sticker: '🎉' },
    ],
    button: 'Continue to Our Firsts →',
  },
  firsts: {
    title: 'Our Firsts ❤️',
    cards: [
      { title: 'First Hello', description: 'The very first word that started it all.', emoji: '👋' },
      { title: 'First Call', description: 'That nervous but exciting first phone call.', emoji: '📞' },
      { title: 'First Picture', description: 'The first photo we took together.', emoji: '📸' },
      { title: 'First Meeting', description: 'When we finally met in person.', emoji: '💕' },
      { title: 'First Date', description: 'A perfect first date I\'ll always cherish.', emoji: '🍽️' },
      { title: 'First "I Love You"', description: 'Those three words that changed everything.', emoji: '❤️' },
      { title: 'First Special Memory', description: 'A moment that became our treasure.', emoji: '✨' },
    ],
    button: 'Continue to Reasons →',
  },
  reasons: {
    title: 'Little Reasons I Love You ❤️',
    cards: [
      'Because you make ordinary days feel special.',
      'Because your smile lights up my whole world.',
      'Because you understand me without words.',
      'Because you make me a better person.',
      'Because your laugh is my favorite sound.',
      'Because you believe in us, always.',
      'Because you are my home, no matter where we are.',
      'Because you chose me, and I\'ll never stop being grateful.',
      'Because you are my favorite person, forever.',
      'Because every moment with you is a treasure.',
    ],
    button: 'Continue to Surprise →',
  },
  surprise: {
    title: 'I have a little surprise for you...',
    subtitle: 'Wanna see it? 👀❤️',
    yesText: 'YES ❤️',
    noText: 'NO 🙈',
    noResponse: 'How dare you click NO? 🥺',
    noResponseSub: 'Try Again ❤️',
    revealedMessage: 'You just made me smile so big! 😊 Here\'s to us, to love, and to forever. I love you! ❤️',
    button: 'Continue →',
  },
  photoWall: {
    title: 'Our Photo Wall 📸',
    photos: [
      { src: '/images/wall-1.jpg', caption: 'Us ❤️', sticker: '💕' },
      { src: '/images/wall-2.jpg', caption: 'Happy Days', sticker: '🌸' },
      { src: '/images/wall-3.jpg', caption: 'Love', sticker: '💖' },
      { src: '/images/wall-4.jpg', caption: 'Forever', sticker: '✨' },
      { src: '/images/wall-5.jpg', caption: 'Together', sticker: '💑' },
      { src: '/images/wall-6.jpg', caption: 'Memories', sticker: '📷' },
    ],
    button: 'Continue to Letter →',
  },
  letter: {
    title: 'To My Favorite Person ❤️',
    button: 'Open Letter 💌',
    content: `
      My Dearest ${partner1},

      From the moment you came into my life, everything changed for the better.
      You brought light, laughter, and a love I never knew was possible.

      Every day with you feels like a beautiful dream — one I never want to wake up from.
      Your smile, your kindness, your heart... they are my favorite things in this world.

      Thank you for choosing me, for loving me, and for being my forever person.
      I can't wait to spend the rest of my life making memories with you.

      Forever yours,
      ${partner2} ❤️
    `,
    buttonNext: 'Continue to Favorite Moments →',
  },
  favoriteMoments: {
    title: 'Our Favorite Moments ✨',
    cards: [
      { title: 'That Day...', description: 'The day we knew we were meant to be.', image: '/images/fav-1.jpg', sticker: '🌟' },
      { title: 'That Smile...', description: 'Your smile that makes my heart skip.', image: '/images/fav-2.jpg', sticker: '😊' },
      { title: 'Our Random Adventures', description: 'Getting lost together, finding joy.', image: '/images/fav-3.jpg', sticker: '🗺️' },
      { title: 'My Favorite Picture', description: 'A moment frozen in time, forever.', image: '/images/fav-4.jpg', sticker: '📷' },
      { title: 'That One Special Moment', description: 'When I knew I was home.', image: '/images/fav-5.jpg', sticker: '🏠' },
      { title: 'Just Us', description: 'The best part of every day.', image: '/images/fav-6.jpg', sticker: '💑' },
    ],
    button: 'Continue to Bucket List →',
  },
  bucketList: {
    title: 'Things I Still Want To Do With You ❤️',
    items: [
      { text: 'Travel together ✈️', completed: false },
      { text: 'Watch sunsets 🌅', completed: false },
      { text: 'Take more pictures 📷', completed: false },
      { text: 'Celebrate more anniversaries 🎉', completed: false },
      { text: 'Make more memories 🌸', completed: false },
      { text: 'Grow old together 👴👵', completed: false },
      { text: 'Dance in the rain 🌧️', completed: false },
      { text: 'Build our forever home 🏠', completed: false },
    ],
    button: 'Continue to Our Universe →',
  },
  universe: {
    title: 'Our Little Universe 🌙❤️',
    quote: 'In a universe of possibilities, I\'m grateful you\'re my constant.',
    stars: [
      { message: 'You are my favorite person.' },
      { message: 'I\'d choose you again, every time.' },
      { message: 'More memories to come.' },
      { message: 'You make my world brighter.' },
      { message: 'Forever starts with you.' },
      { message: 'Love you to the moon and back.' },
    ],
    button: 'Continue to Last Surprise →',
  },
  lastSurprise: {
    title: 'Wait... there\'s still one more thing.',
    button: 'Open Your Surprise 🎁',
    revealedMessage: `After everything we've shared, I still can't wait for everything that's yet to come.`,
    revealedSub: `You are my greatest adventure, ${partner1}. I love you more than words can say. ❤️`,
    buttonNext: 'Continue to Finale →',
  },
  finale: {
    title: `Happy Anniversary, ${partner1} ❤️`,
    message: `To more memories, more laughter, more adventures, and a lifetime of choosing each other.`,
    anniversary: `Happy Wedding Anniversary ${partner1} & ${partner2} 💍❤️`,
    forever: 'Forever & Always ❤️',
    button: 'Replay Our Story ↺',
    date: anniversaryDate,
  },
};
export default CONTENT;
EOF

# stickers.js
cat > client/src/data/stickers.js << 'EOF'
export const STICKERS = {
  couple: '💑',
  coupleHug: '🤗',
  coupleKiss: '💏',
  teddy: '🧸',
  teddyBear: '🐻',
  rings: '💍',
  rose: '🌹',
  roses: '🌹🌹',
  bow: '🎀',
  envelope: '💌',
  heart: '❤️',
  hearts: '💕',
  sparklingHeart: '💖',
  butterfly: '🦋',
  star: '⭐',
  stars: '✨',
  moon: '🌙',
  flower: '🌸',
  flowers: '🌺',
  gift: '🎁',
  giftBox: '🎀',
  camera: '📷',
  airplane: '✈️',
  sun: '☀️',
  rainbow: '🌈',
  music: '🎵',
  sparkles: '✨',
};
export default STICKERS;
EOF

# photos.js
cat > client/src/data/photos.js << 'EOF'
export const PHOTOS = {
  memories: ['/images/memory-1.jpg', '/images/memory-2.jpg', '/images/memory-3.jpg', '/images/memory-4.jpg'],
  wall: ['/images/wall-1.jpg', '/images/wall-2.jpg', '/images/wall-3.jpg', '/images/wall-4.jpg', '/images/wall-5.jpg', '/images/wall-6.jpg'],
  favorites: ['/images/fav-1.jpg', '/images/fav-2.jpg', '/images/fav-3.jpg', '/images/fav-4.jpg', '/images/fav-5.jpg', '/images/fav-6.jpg'],
  surprise: '/images/surprise-photo.jpg',
  finale: '/images/finale-photo.jpg',
  placeholder: '/images/placeholder.jpg',
};
export default PHOTOS;
EOF

# ----- PAGES (15 files) -----
# We'll put all pages in client/src/pages/

# Page1_Login.jsx
cat > client/src/pages/Page1_Login.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { motion } from 'framer-motion';
import { Lock, Sparkles } from 'lucide-react';
import axios from 'axios';
import FloatingHearts from '../components/ui/FloatingHearts.jsx';
import Sticker from '../components/ui/Sticker.jsx';

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    const token = localStorage.getItem('anniversary_token');
    if (token) navigate('/page/2');
  }, [navigate]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setIsLoading(true);
    try {
      const response = await axios.post('/api/auth/login', { username: username.trim(), password: password.trim() });
      if (response.data.success) {
        localStorage.setItem('anniversary_token', response.data.token);
        navigate('/page/2');
      } else {
        setError('Oops... this little world is private 💗');
      }
    } catch (err) {
      setError('Oops... this little world is private 💗');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen w-full flex items-center justify-center px-4 py-8 bg-gradient-to-br from-romance-red/5 via-romance-cream to-romance-pink/20 relative overflow-hidden">
      <FloatingHearts count={25} />
      <Sticker emoji="💕" size="text-6xl" className="absolute top-10 left-10 opacity-30" />
      <Sticker emoji="🌸" size="text-5xl" className="absolute bottom-10 right-10 opacity-30" />
      <motion.div className="glass-card w-full max-w-md p-8 md:p-10 rounded-3xl shadow-2xl relative z-10" initial={{ scale: 0.9, opacity: 0 }} animate={{ scale: 1, opacity: 1 }} transition={{ duration: 0.6 }}>
        <div className="flex justify-center mb-4"><div className="p-4 bg-romance-red/10 rounded-full"><Lock size={32} className="text-romance-red" /></div></div>
        <h1 className="text-2xl md:text-3xl font-serif text-center text-romance-red font-semibold">Welcome to Our Little World</h1>
        <p className="text-center text-gray-500 mt-2 text-sm md:text-base">This little place is only for you.</p>
        <div className="flex justify-center my-4"><span className="text-5xl animate-float">💑</span></div>
        <form onSubmit={handleSubmit} className="space-y-5 mt-6">
          <div><label className="block text-sm font-medium text-gray-600 mb-1">Username</label><input type="text" value={username} onChange={(e) => setUsername(e.target.value)} className="w-full px-4 py-3 rounded-xl border border-romance-pink/30 focus:border-romance-red focus:ring-2 focus:ring-romance-red/20 outline-none transition-all bg-white/70" placeholder="Enter your username" required /></div>
          <div><label className="block text-sm font-medium text-gray-600 mb-1">Password</label><input type="password" value={password} onChange={(e) => setPassword(e.target.value)} className="w-full px-4 py-3 rounded-xl border border-romance-pink/30 focus:border-romance-red focus:ring-2 focus:ring-romance-red/20 outline-none transition-all bg-white/70" placeholder="Enter your password" required /></div>
          {error && <motion.p className="text-romance-red text-sm text-center" initial={{ opacity: 0, y: -10 }} animate={{ opacity: 1, y: 0 }}>{error}</motion.p>}
          <motion.button type="submit" whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }} disabled={isLoading} className="w-full btn-primary text-lg py-4">
            {isLoading ? <span className="flex items-center gap-2"><Sparkles className="animate-spin" size={20} /> Entering...</span> : <span className="flex items-center gap-2">Enter Our Story ❤️</span>}
          </motion.button>
        </form>
        <p className="text-center text-xs text-gray-400 mt-6">Made with love for Taimoor ❤️ Hoorain</p>
      </motion.div>
    </div>
  );
};
export default Login;
EOF

# Page2_Welcome.jsx
cat > client/src/pages/Page2_Welcome.jsx << 'EOF'
import React, { useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const Welcome = () => {
  const nextPage = getNextPage(2);
  const content = CONTENT.welcome;
  useEffect(() => { document.title = 'Welcome ❤️ Taimoor & Hoorain'; }, []);
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="💕" size="text-5xl" className="absolute -top-4 -left-4" rotate={-15} />
      <Sticker emoji="🌸" size="text-4xl" className="absolute -bottom-2 -right-2" rotate={12} />
      <div className="text-center space-y-6 max-w-2xl">
        <motion.div initial={{ scale: 0 }} animate={{ scale: 1 }} transition={{ type: 'spring', stiffness: 200, delay: 0.2 }}><span className="text-7xl md:text-8xl inline-block">💑</span></motion.div>
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }}>{content.title}</motion.h1>
        <motion.p className="text-lg md:text-xl text-gray-600 font-serif" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.5 }}>{content.subtitle}</motion.p>
        <motion.div className="bg-romance-red/5 rounded-2xl p-6 border border-romance-pink/20" initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} transition={{ delay: 0.6 }}>
          <p className="text-xl md:text-2xl font-serif text-romance-red">{content.anniversary}</p>
        </motion.div>
        <motion.div className="flex justify-center gap-4 flex-wrap mt-4" initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 0.8 }}>
          <span className="text-3xl animate-float" style={{ animationDelay: '0s' }}>💖</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '0.5s' }}>✨</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '1s' }}>🌹</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '1.5s' }}>💕</span>
          <span className="text-3xl animate-float" style={{ animationDelay: '2s' }}>🌟</span>
        </motion.div>
      </div>
    </PageLayout>
  );
};
export default Welcome;
EOF

# Page3_Anniversary.jsx
cat > client/src/pages/Page3_Anniversary.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { CONFIG } from '../data/config.js';
import { getNextPage } from '../data/pagesConfig.js';

const Anniversary = () => {
  const nextPage = getNextPage(3);
  const content = CONTENT.anniversary;
  const [time, setTime] = useState({ years: 0, months: 0, days: 0, hours: 0, minutes: 0, seconds: 0 });

  useEffect(() => {
    document.title = 'Our Special Day ❤️';
    const target = new Date(CONFIG.anniversaryDate);
    const update = () => {
      const now = new Date();
      const diff = now - target;
      if (diff <= 0) { setTime({ years: 0, months: 0, days: 0, hours: 0, minutes: 0, seconds: 0 }); return; }
      const seconds = Math.floor(diff / 1000);
      const minutes = Math.floor(seconds / 60);
      const hours = Math.floor(minutes / 60);
      const days = Math.floor(hours / 24);
      const months = Math.floor(days / 30.44);
      const years = Math.floor(months / 12);
      setTime({ years, months: months % 12, days: days % 30, hours: hours % 24, minutes: minutes % 60, seconds: seconds % 60 });
    };
    update();
    const interval = setInterval(update, 1000);
    return () => clearInterval(interval);
  }, []);

  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="💍" size="text-5xl" className="absolute -top-4 -right-4" rotate={15} />
      <Sticker emoji="🌹" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-10} />
      <div className="text-center space-y-6 max-w-3xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <motion.div className="flex justify-center gap-3" initial={{ opacity: 0, scale: 0.8 }} animate={{ opacity: 1, scale: 1 }} transition={{ delay: 0.2 }}>
          <span className="text-4xl">💑</span><span className="text-4xl heart-beat">❤️</span><span className="text-4xl">💍</span>
        </motion.div>
        <motion.div className="glass-card p-6 md:p-8 rounded-2xl" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }}>
          <p className="text-lg md:text-xl text-gray-600 mb-4">{content.togetherSince}</p>
          <div className="grid grid-cols-3 md:grid-cols-6 gap-3 md:gap-4">
            {[
              { label: content.years, value: time.years },
              { label: content.months, value: time.months },
              { label: content.days, value: time.days },
              { label: content.hours, value: time.hours },
              { label: content.minutes, value: time.minutes },
              { label: content.seconds, value: time.seconds },
            ].map((item, idx) => (
              <motion.div key={idx} className="bg-white/50 rounded-xl p-3 backdrop-blur-sm" initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.4 + idx * 0.08 }}>
                <div className="text-2xl md:text-3xl font-bold text-romance-red">{String(item.value).padStart(2, '0')}</div>
                <div className="text-[10px] md:text-xs text-gray-500 uppercase tracking-wider">{item.label}</div>
              </motion.div>
            ))}
          </div>
        </motion.div>
      </div>
    </PageLayout>
  );
};
export default Anniversary;
EOF

# Page4_HowItStarted.jsx
cat > client/src/pages/Page4_HowItStarted.jsx << 'EOF'
import React, { useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const HowItStarted = () => {
  const nextPage = getNextPage(4);
  const content = CONTENT.howItStarted;
  useEffect(() => { document.title = 'How It All Started ❤️'; }, []);
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="💌" size="text-5xl" className="absolute -top-4 -right-4" rotate={12} />
      <Sticker emoji="🌸" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-8} />
      <div className="text-center space-y-6 max-w-3xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <div className="space-y-4 w-full">
          {content.timeline.map((item, idx) => (
            <motion.div key={idx} className="glass-card p-4 md:p-5 rounded-2xl flex items-start gap-4 text-left hover:shadow-lg transition-all" initial={{ opacity: 0, x: idx % 2 === 0 ? -30 : 30 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }} transition={{ delay: idx * 0.1 }}>
              <div className="flex-shrink-0 text-3xl mt-1">{item.sticker || '💕'}</div>
              <div><h3 className="font-serif text-lg md:text-xl text-romance-red font-semibold">{item.title}</h3><p className="text-sm text-gray-500">{item.date}</p><p className="text-gray-600 mt-1">{item.description}</p></div>
            </motion.div>
          ))}
        </div>
      </div>
    </PageLayout>
  );
};
export default HowItStarted;
EOF

# Page5_Memories.jsx
cat > client/src/pages/Page5_Memories.jsx << 'EOF'
import React, { useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import MemoryCard from '../components/ui/MemoryCard.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const Memories = () => {
  const nextPage = getNextPage(5);
  const content = CONTENT.memories;
  useEffect(() => { document.title = 'Our Memories ❤️'; }, []);
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="📷" size="text-5xl" className="absolute -top-4 -right-4" rotate={10} />
      <Sticker emoji="🌸" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-12} />
      <div className="text-center space-y-6 max-w-4xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 md:gap-6 w-full">
          {content.cards.map((card, idx) => (
            <MemoryCard key={idx} title={card.title} description={card.description} date={card.date} image={card.image} sticker={card.sticker} className="hover:shadow-xl" />
          ))}
        </div>
      </div>
    </PageLayout>
  );
};
export default Memories;
EOF

# Page6_Firsts.jsx
cat > client/src/pages/Page6_Firsts.jsx << 'EOF'
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
EOF

# Page7_Reasons.jsx
cat > client/src/pages/Page7_Reasons.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const Reasons = () => {
  const nextPage = getNextPage(7);
  const content = CONTENT.reasons;
  const [openIndex, setOpenIndex] = useState(null);
  useEffect(() => { document.title = 'Reasons I Love You ❤️'; }, []);
  const toggleCard = (idx) => { setOpenIndex(openIndex === idx ? null : idx); };
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="💌" size="text-5xl" className="absolute -top-4 -right-4" rotate={12} />
      <Sticker emoji="🌹" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-10} />
      <div className="text-center space-y-6 max-w-3xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 w-full">
          {content.cards.map((reason, idx) => (
            <motion.div key={idx} className="glass-card p-4 rounded-2xl cursor-pointer hover:shadow-lg transition-all" initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: idx * 0.05 }} onClick={() => toggleCard(idx)}>
              <div className="flex items-center gap-3">
                <div className="text-2xl flex-shrink-0">{openIndex === idx ? '💖' : '💌'}</div>
                <AnimatePresence mode="wait">
                  {openIndex === idx ? (
                    <motion.p key="open" className="text-sm text-gray-700 text-left flex-1" initial={{ opacity: 0, height: 0 }} animate={{ opacity: 1, height: 'auto' }} exit={{ opacity: 0, height: 0 }}>{reason}</motion.p>
                  ) : (
                    <motion.p key="closed" className="text-sm text-gray-500 text-left flex-1 truncate" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}>Click to reveal ❤️</motion.p>
                  )}
                </AnimatePresence>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </PageLayout>
  );
};
export default Reasons;
EOF

# Page8_Surprise.jsx
cat > client/src/pages/Page8_Surprise.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const Surprise = () => {
  const nextPage = getNextPage(8);
  const content = CONTENT.surprise;
  const [revealed, setRevealed] = useState(false);
  const [noClicks, setNoClicks] = useState(0);
  const [noMessage, setNoMessage] = useState('');
  const [buttonPosition, setButtonPosition] = useState({ x: 0, y: 0 });
  const navigate = useNavigate();
  useEffect(() => { document.title = 'Little Surprise ❤️'; }, []);

  const handleYes = () => setRevealed(true);
  const handleNo = () => {
    const clicks = noClicks + 1;
    setNoClicks(clicks);
    if (clicks === 1) { setNoMessage(content.noResponse); setButtonPosition({ x: (Math.random() - 0.5) * 60, y: (Math.random() - 0.5) * 60 }); }
    else if (clicks === 2) { setNoMessage(content.noResponseSub); setButtonPosition({ x: (Math.random() - 0.5) * 100, y: (Math.random() - 0.5) * 100 }); }
    else { setNoMessage('Come on, just say YES! 🥺❤️'); setButtonPosition({ x: (Math.random() - 0.5) * 120, y: (Math.random() - 0.5) * 120 }); }
  };
  const handleContinue = () => navigate(nextPage);

  return (
    <div className="page-container relative min-h-screen">
      <Sticker emoji="🎁" size="text-6xl" className="absolute -top-4 -right-4" rotate={12} />
      <Sticker emoji="💕" size="text-5xl" className="absolute -bottom-2 -left-4" rotate={-8} />
      <div className="relative z-10 w-full max-w-2xl mx-auto flex-1 flex flex-col items-center justify-center px-4 py-8">
        <AnimatePresence mode="wait">
          {!revealed ? (
            <motion.div key="question" className="text-center space-y-6 w-full" initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} exit={{ opacity: 0, scale: 0.8 }}>
              <h1 className="text-3xl md:text-4xl font-serif text-romance-red font-bold">{content.title}</h1>
              <p className="text-xl md:text-2xl text-gray-600">{content.subtitle}</p>
              <div className="flex justify-center gap-6 mt-6 flex-wrap">
                <motion.button whileHover={{ scale: 1.08 }} whileTap={{ scale: 0.95 }} onClick={handleYes} className="px-8 py-4 bg-romance-red text-white rounded-full text-lg font-semibold shadow-lg hover:shadow-xl transition-all">{content.yesText}</motion.button>
                <motion.button whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }} onClick={handleNo} className="px-8 py-4 bg-romance-pink/30 text-romance-red rounded-full text-lg font-semibold border border-romance-pink/50 transition-all" style={{ transform: `translate(${buttonPosition.x}px, ${buttonPosition.y}px)` }}>{content.noText}</motion.button>
              </div>
              {noMessage && <motion.p className="text-romance-red text-lg font-serif mt-4" initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }}>{noMessage}</motion.p>}
            </motion.div>
          ) : (
            <motion.div key="revealed" className="text-center space-y-6 w-full" initial={{ opacity: 0, scale: 0.8, y: 20 }} animate={{ opacity: 1, scale: 1, y: 0 }} transition={{ type: 'spring', stiffness: 200 }}>
              <div className="text-7xl md:text-8xl">🎉</div>
              <h2 className="text-3xl md:text-4xl font-serif text-romance-red font-bold">Surprise! ❤️</h2>
              <p className="text-lg md:text-xl text-gray-700 max-w-lg mx-auto">{content.revealedMessage}</p>
              <div className="flex justify-center gap-3 text-3xl">
                <span className="heart-beat">❤️</span>
                <span className="animate-float" style={{ animationDelay: '0.3s' }}>💕</span>
                <span className="animate-float" style={{ animationDelay: '0.6s' }}>✨</span>
                <span className="animate-float" style={{ animationDelay: '0.9s' }}>🌹</span>
              </div>
              <motion.button whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }} onClick={handleContinue} className="btn-primary mt-4">{content.button}</motion.button>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </div>
  );
};
export default Surprise;
EOF

# Page9_PhotoWall.jsx
cat > client/src/pages/Page9_PhotoWall.jsx << 'EOF'
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
EOF

# Page10_Letter.jsx
cat > client/src/pages/Page10_Letter.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';
import { Heart } from 'lucide-react';

const Letter = () => {
  const nextPage = getNextPage(10);
  const content = CONTENT.letter;
  const [isOpen, setIsOpen] = useState(false);
  useEffect(() => { document.title = 'A Letter For You ❤️'; }, []);

  return (
    <PageLayout nextPage={nextPage} nextText={content.buttonNext} showNext={isOpen}>
      <Sticker emoji="💌" size="text-6xl" className="absolute -top-4 -right-4" rotate={15} />
      <Sticker emoji="🌸" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-10} />
      <div className="text-center space-y-6 max-w-2xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <AnimatePresence mode="wait">
          {!isOpen ? (
            <motion.div key="envelope" className="flex flex-col items-center gap-4" initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} exit={{ opacity: 0, scale: 0.8 }}>
              <div className="text-8xl md:text-9xl cursor-pointer hover:scale-110 transition-transform" onClick={() => setIsOpen(true)}>💌</div>
              <motion.button whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }} onClick={() => setIsOpen(true)} className="btn-primary">{content.button}</motion.button>
            </motion.div>
          ) : (
            <motion.div key="letter" className="glass-card p-6 md:p-8 rounded-2xl text-left max-h-[60vh] overflow-y-auto" initial={{ opacity: 0, y: 30, rotateX: 10 }} animate={{ opacity: 1, y: 0, rotateX: 0 }} exit={{ opacity: 0, y: -30 }} transition={{ type: 'spring', damping: 20 }}>
              <div className="prose prose-romance max-w-none">
                {content.content.split('\n').map((line, idx) => <p key={idx} className="text-gray-700 leading-relaxed mb-3 font-serif text-base md:text-lg">{line.trim()}</p>)}
              </div>
              <div className="flex justify-end mt-4"><Heart className="text-romance-red/50" size={24} /></div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </PageLayout>
  );
};
export default Letter;
EOF

# Page11_FavoriteMoments.jsx
cat > client/src/pages/Page11_FavoriteMoments.jsx << 'EOF'
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
EOF

# Page12_BucketList.jsx
cat > client/src/pages/Page12_BucketList.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';
import { CheckCircle, Circle } from 'lucide-react';

const BucketList = () => {
  const nextPage = getNextPage(12);
  const content = CONTENT.bucketList;
  const [items, setItems] = useState([]);
  useEffect(() => {
    document.title = 'Bucket List ❤️';
    setItems(content.items.map((item, idx) => ({ ...item, id: idx })));
  }, []);
  const toggleItem = (id) => { setItems(items.map(item => item.id === id ? { ...item, completed: !item.completed } : item)); };
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="✈️" size="text-5xl" className="absolute -top-4 -right-4" rotate={10} />
      <Sticker emoji="🌅" size="text-4xl" className="absolute -bottom-2 -left-4" rotate={-8} />
      <div className="text-center space-y-6 max-w-2xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <div className="space-y-3 w-full">
          {items.map((item, idx) => (
            <motion.div key={item.id} className="glass-card p-4 rounded-2xl cursor-pointer hover:shadow-lg transition-all flex items-center gap-4" whileHover={{ scale: 1.02 }} initial={{ opacity: 0, x: -20 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }} transition={{ delay: idx * 0.06 }} onClick={() => toggleItem(item.id)}>
              <div className="flex-shrink-0">{item.completed ? <CheckCircle className="text-romance-red" size={28} /> : <Circle className="text-romance-pink" size={28} />}</div>
              <span className={`text-base md:text-lg font-serif ${item.completed ? 'text-romance-red line-through' : 'text-gray-700'}`}>{item.text}</span>
            </motion.div>
          ))}
        </div>
      </div>
    </PageLayout>
  );
};
export default BucketList;
EOF

# Page13_Universe.jsx
cat > client/src/pages/Page13_Universe.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';

const Universe = () => {
  const nextPage = getNextPage(13);
  const content = CONTENT.universe;
  const [starMessages, setStarMessages] = useState([]);
  useEffect(() => {
    document.title = 'Our Little Universe 🌙';
    setStarMessages(content.stars.map((s, i) => ({ ...s, id: i, revealed: false })));
  }, []);
  const toggleStar = (id) => { setStarMessages(stars => stars.map(s => s.id === id ? { ...s, revealed: !s.revealed } : s)); };
  return (
    <PageLayout nextPage={nextPage} nextText={content.button}>
      <Sticker emoji="🌙" size="text-6xl" className="absolute -top-4 -right-4" rotate={10} />
      <Sticker emoji="⭐" size="text-5xl" className="absolute -bottom-2 -left-4" rotate={-8} />
      <div className="text-center space-y-6 max-w-3xl w-full">
        <motion.h1 className="text-3xl md:text-5xl font-serif text-romance-red font-bold" initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}>{content.title}</motion.h1>
        <motion.p className="text-lg md:text-xl text-gray-600 font-serif italic" initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 0.2 }}>"{content.quote}"</motion.p>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-3 w-full">
          {starMessages.map((star, idx) => (
            <motion.div key={star.id} className="glass-card p-4 rounded-2xl cursor-pointer hover:shadow-xl transition-all text-center min-h-[80px] flex items-center justify-center" whileHover={{ scale: 1.05, y: -4 }} initial={{ opacity: 0, scale: 0.8 }} whileInView={{ opacity: 1, scale: 1 }} viewport={{ once: true }} transition={{ delay: idx * 0.08 }} onClick={() => toggleStar(star.id)}>
              <AnimatePresence mode="wait">
                {!star.revealed ? (
                  <motion.div key="star" className="text-4xl" initial={{ scale: 0 }} animate={{ scale: 1 }} exit={{ scale: 0 }}>⭐</motion.div>
                ) : (
                  <motion.p key="message" className="text-sm text-gray-700 font-serif" initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -10 }}>{star.message}</motion.p>
                )}
              </AnimatePresence>
            </motion.div>
          ))}
        </div>
        <p className="text-xs text-gray-400">✨ Click a star to reveal a message ✨</p>
      </div>
    </PageLayout>
  );
};
export default Universe;
EOF

# Page14_LastSurprise.jsx
cat > client/src/pages/Page14_LastSurprise.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import PageLayout from '../components/ui/PageLayout.jsx';
import Sticker from '../components/ui/Sticker.jsx';
import Confetti from '../components/ui/Confetti.jsx';
import { CONTENT } from '../data/content.js';
import { getNextPage } from '../data/pagesConfig.js';
import { Gift } from 'lucide-react';

const LastSurprise = () => {
  const nextPage = getNextPage(14);
  const content = CONTENT.lastSurprise;
  const [revealed, setRevealed] = useState(false);
  const [showConfetti, setShowConfetti] = useState(false);
  useEffect(() => { document.title = 'One Last Surprise 🎁'; }, []);
  const handleOpen = () => { setRevealed(true); setShowConfetti(true); setTimeout(() => setShowConfetti(false), 5000); };
  return (
    <PageLayout nextPage={nextPage} nextText={content.buttonNext} showNext={revealed}>
      {showConfetti && <Confetti count={150} duration={4500} />}
      <Sticker emoji="🎁" size="text-6xl" className="absolute -top-4 -right-4" rotate={12} />
      <Sticker emoji="💕" size="text-5xl" className="absolute -bottom-2 -left-4" rotate={-10} />
      <div className="text-center space-y-6 max-w-2xl w-full">
        <AnimatePresence mode="wait">
          {!revealed ? (
            <motion.div key="hidden" className="space-y-6" initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} exit={{ opacity: 0, scale: 0.8 }}>
              <h1 className="text-3xl md:text-4xl font-serif text-romance-red font-bold">{content.title}</h1>
              <motion.button whileHover={{ scale: 1.08 }} whileTap={{ scale: 0.95 }} onClick={handleOpen} className="btn-primary text-xl py-5 px-10"><Gift className="mr-2" size={24} />{content.button}</motion.button>
            </motion.div>
          ) : (
            <motion.div key="revealed" className="space-y-6" initial={{ opacity: 0, y: 30 }} animate={{ opacity: 1, y: 0 }} transition={{ type: 'spring', stiffness: 200 }}>
              <div className="text-7xl md:text-8xl">🎉</div>
              <h2 className="text-3xl md:text-5xl font-serif text-romance-red font-bold">Surprise! 💖</h2>
              <div className="glass-card p-6 md:p-8 rounded-2xl space-y-4">
                <p className="text-lg md:text-xl text-gray-700 font-serif leading-relaxed">{content.revealedMessage}</p>
                <p className="text-base md:text-lg text-romance-red font-serif">{content.revealedSub}</p>
              </div>
              <div className="flex justify-center gap-3 text-3xl">
                <span className="heart-beat">❤️</span>
                <span className="animate-float" style={{ animationDelay: '0.3s' }}>💕</span>
                <span className="animate-float" style={{ animationDelay: '0.6s' }}>🌹</span>
                <span className="animate-float" style={{ animationDelay: '0.9s' }}>✨</span>
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </PageLayout>
  );
};
export default LastSurprise;
EOF

# Page15_Finale.jsx
cat > client/src/pages/Page15_Finale.jsx << 'EOF'
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
        <motion.p className="text-xs text-gray-400 mt-8" initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 1.5 }}>Made with infinite love for Taimoor ❤️ Hoorain</motion.p>
      </div>
    </div>
  );
};
export default Finale;
EOF

# ================================================================
#  SERVER FILES
# ================================================================

# server/package.json
cat > server/package.json << 'EOF'
{
  "name": "anniversary-server",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "start": "node src/server.js",
    "dev": "nodemon src/server.js"
  },
  "dependencies": {
    "bcryptjs": "^2.4.3",
    "cors": "^2.8.5",
    "dotenv": "^16.3.1",
    "express": "^4.18.2",
    "jsonwebtoken": "^9.0.2"
  },
  "devDependencies": {
    "nodemon": "^3.0.2"
  }
}
EOF

# server/.env
cat > server/.env << 'EOF'
PORT=5000
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
USERNAME=taimoor
PASSWORD=loveforever
EOF

# server/src/config/env.js
cat > server/src/config/env.js << 'EOF'
import dotenv from 'dotenv';
dotenv.config();
export const PORT = process.env.PORT || 5000;
export const JWT_SECRET = process.env.JWT_SECRET || 'anniversary-secret-key';
export const USERNAME = process.env.USERNAME || 'taimoor';
export const PASSWORD = process.env.PASSWORD || 'loveforever';
EOF

# server/src/server.js
cat > server/src/server.js << 'EOF'
import express from 'express';
import cors from 'cors';
import authRoutes from './routes/authRoutes.js';
import { PORT } from './config/env.js';

const app = express();
app.use(cors({ origin: 'http://localhost:5173', credentials: true }));
app.use(express.json());
app.use('/api/auth', authRoutes);
app.get('/api/health', (req, res) => res.json({ status: 'ok', message: '❤️ Anniversary API is running' }));
app.listen(PORT, () => console.log(`✨ Server running on http://localhost:${PORT}`));
EOF

# server/src/routes/authRoutes.js
cat > server/src/routes/authRoutes.js << 'EOF'
import express from 'express';
import { login, logout, verify, me } from '../controllers/authController.js';
import { authenticate } from '../middleware/authMiddleware.js';

const router = express.Router();
router.post('/login', login);
router.post('/logout', logout);
router.get('/verify', authenticate, verify);
router.get('/me', authenticate, me);
export default router;
EOF

# server/src/controllers/authController.js
cat > server/src/controllers/authController.js << 'EOF'
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { JWT_SECRET, USERNAME, PASSWORD } from '../config/env.js';

const SALT_ROUNDS = 10;
const hashedPassword = bcrypt.hashSync(PASSWORD, SALT_ROUNDS);

export const login = async (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) return res.status(400).json({ message: 'Username and password required' });
  if (username !== USERNAME) return res.status(401).json({ message: 'Invalid credentials' });
  const validPassword = await bcrypt.compare(password, hashedPassword);
  if (!validPassword) return res.status(401).json({ message: 'Invalid credentials' });
  const token = jwt.sign({ username, role: 'user' }, JWT_SECRET, { expiresIn: '7d' });
  res.json({ success: true, token, user: { username }, message: 'Welcome back! ❤️' });
};

export const logout = (req, res) => res.json({ success: true, message: 'Logged out' });
export const verify = (req, res) => res.json({ authenticated: true, user: req.user });
export const me = (req, res) => res.json({ user: req.user });
EOF

# server/src/middleware/authMiddleware.js
cat > server/src/middleware/authMiddleware.js << 'EOF'
import jwt from 'jsonwebtoken';
import { JWT_SECRET } from '../config/env.js';

export const authenticate = (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith('Bearer ')) return res.status(401).json({ message: 'Authentication required' });
  const token = authHeader.split(' ')[1];
  try {
    const decoded = jwt.verify(token, JWT_SECRET);
    req.user = decoded;
    next();
  } catch (error) {
    return res.status(401).json({ message: 'Invalid or expired token' });
  }
};
EOF

echo "✅ All files created successfully!"
echo "Next steps:"
echo "  npm run install:all    # install dependencies"
echo "  npm run dev            # start both client & server"
echo "  Then open http://localhost:5173"