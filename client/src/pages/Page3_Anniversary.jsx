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
