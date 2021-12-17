import React from 'react';
import { Routes, Route } from 'react-router-dom';
import Loading from './utils/Loading';

const Home = React.lazy(() => import('./pages/Home'));

const AllRoutes = () => {
  return (
    <Routes>
      <Route
        path='/'
        element={
          <React.Suspense fallback={<Loading />}>
            <Home />
          </React.Suspense>
        }
      />
    </Routes>
  );
};

export default AllRoutes;
