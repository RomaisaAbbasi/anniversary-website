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
