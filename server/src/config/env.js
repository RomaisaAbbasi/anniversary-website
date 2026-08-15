import dotenv from 'dotenv';
dotenv.config();
export const PORT = process.env.PORT || 5000;
export const JWT_SECRET = process.env.JWT_SECRET || 'anniversary-secret-key';
export const USERNAME = process.env.USERNAME || 'taimoor';
export const PASSWORD = process.env.PASSWORD || 'loveforever';
