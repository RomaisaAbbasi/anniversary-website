import express from 'express';
import cors from 'cors';
import authRoutes from '../server/src/routes/authRoutes.js';
import dotenv from 'dotenv';

dotenv.config();

const app = express();

app.use(cors({
  origin: process.env.FRONTEND_URL || '*',
  credentials: true,
}));
app.use(express.json());

app.use('/api/auth', authRoutes);

app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', message: '❤️ Anniversary API is running' });
});

export default app;
