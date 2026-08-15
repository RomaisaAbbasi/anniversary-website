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
