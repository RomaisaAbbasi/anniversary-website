import React from 'react';
import { Navigate, Outlet } from 'react-router-dom';

export const ProtectedRoute = () => {
  const token = localStorage.getItem('anniversary_token');
  if (!token) return <Navigate to="/login" replace />;
  try {
    const parts = token.split('.');
    if (parts.length !== 3) throw new Error('Invalid token');
    return <Outlet />;
  } catch (e) {
    localStorage.removeItem('anniversary_token');
    return <Navigate to="/login" replace />;
  }
};
