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
        <p className="text-center text-xs text-gray-400 mt-6">Made with love for John ❤️ Jane</p>
      </motion.div>
    </div>
  );
};
export default Login;
