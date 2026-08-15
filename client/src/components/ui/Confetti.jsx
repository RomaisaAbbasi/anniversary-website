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
