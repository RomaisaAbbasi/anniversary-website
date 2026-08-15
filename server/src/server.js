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
