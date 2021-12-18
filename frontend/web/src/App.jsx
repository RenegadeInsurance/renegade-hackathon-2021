import { useEffect } from 'react';
import { ThemeProvider } from '@mui/material';
import { BrowserRouter } from 'react-router-dom';
import { customTheme } from './theme';
import AllRoutes from './Routes';

const App = () => {
  useEffect(() => {
    if (JSON.parse(localStorage.getItem('userFT')) === null)
      localStorage.setItem('userFT', true);
  }, []);

  return (
    <ThemeProvider theme={customTheme}>
      <BrowserRouter>
        <AllRoutes />
      </BrowserRouter>
    </ThemeProvider>
  );
};

export default App;
