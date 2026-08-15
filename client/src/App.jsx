import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { ProtectedRoute } from './components/ui/ProtectedRoute.jsx';
import Login from './pages/Page1_Login.jsx';
import Welcome from './pages/Page2_Welcome.jsx';
import Anniversary from './pages/Page3_Anniversary.jsx';
import HowItStarted from './pages/Page4_HowItStarted.jsx';
import Memories from './pages/Page5_Memories.jsx';
import Firsts from './pages/Page6_Firsts.jsx';
import Reasons from './pages/Page7_Reasons.jsx';
import Surprise from './pages/Page8_Surprise.jsx';
import PhotoWall from './pages/Page9_PhotoWall.jsx';
import Letter from './pages/Page10_Letter.jsx';
import FavoriteMoments from './pages/Page11_FavoriteMoments.jsx';
import BucketList from './pages/Page12_BucketList.jsx';
import Universe from './pages/Page13_Universe.jsx';
import LastSurprise from './pages/Page14_LastSurprise.jsx';
import Finale from './pages/Page15_Finale.jsx';

function App() {
  return (
    <Routes>
      <Route path="/login" element={<Login />} />
      <Route element={<ProtectedRoute />}>
        <Route path="/" element={<Navigate to="/page/2" replace />} />
        <Route path="/page/2" element={<Welcome />} />
        <Route path="/page/3" element={<Anniversary />} />
        <Route path="/page/4" element={<HowItStarted />} />
        <Route path="/page/5" element={<Memories />} />
        <Route path="/page/6" element={<Firsts />} />
        <Route path="/page/7" element={<Reasons />} />
        <Route path="/page/8" element={<Surprise />} />
        <Route path="/page/9" element={<PhotoWall />} />
        <Route path="/page/10" element={<Letter />} />
        <Route path="/page/11" element={<FavoriteMoments />} />
        <Route path="/page/12" element={<BucketList />} />
        <Route path="/page/13" element={<Universe />} />
        <Route path="/page/14" element={<LastSurprise />} />
        <Route path="/page/15" element={<Finale />} />
        <Route path="*" element={<Navigate to="/page/2" replace />} />
      </Route>
    </Routes>
  );
}
export default App;
