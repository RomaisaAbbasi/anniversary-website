import React from 'react';
import { motion } from 'framer-motion';
import NextButton from './NextButton.jsx';
import BackButton from './BackButton.jsx';
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
