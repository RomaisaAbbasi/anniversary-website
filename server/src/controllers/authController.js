import jwt from 'jsonwebtoken';
import { JWT_SECRET } from '../config/env.js';

export const login = async (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    return res.status(400).json({ message: 'Username and password required' });
  }
  
  // 🔓 TEMPORARILY ACCEPT ANY USERNAME & PASSWORD
  // No validation – just issue a token
  const token = jwt.sign({ username, role: 'user' }, JWT_SECRET, { expiresIn: '7d' });
  res.json({ 
    success: true, 
    token, 
    user: { username }, 
    message: 'Welcome back! ❤️' 
  });
};

export const logout = (req, res) => res.json({ success: true, message: 'Logged out' });
export const verify = (req, res) => res.json({ authenticated: true, user: req.user });
export const me = (req, res) => res.json({ user: req.user });
