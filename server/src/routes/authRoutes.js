import express from 'express';
import { login, logout, verify, me } from '../controllers/authController.js';
import { authenticate } from '../middleware/authMiddleware.js';

const router = express.Router();
router.post('/login', login);
router.post('/logout', logout);
router.get('/verify', authenticate, verify);
router.get('/me', authenticate, me);
export default router;
