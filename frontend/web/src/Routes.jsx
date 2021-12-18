import React from 'react';
import { Routes, Route } from 'react-router-dom';
import Loading from './utils/Loading';

const Home = React.lazy(() => import('./pages/Home'));
const FormStuff = React.lazy(() => import('./pages/FormStuff'));

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
      <Route
        path='/formstuff'
        element={
          <React.Suspense fallback={<Loading />}>
            <FormStuff />
          </React.Suspense>
        }
      />
      <Route path='*' element={<>404 Not Found</>} />
    </Routes>
  );
};

export default AllRoutes;
