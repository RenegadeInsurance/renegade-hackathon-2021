import { useEffect } from 'react';
import { ThemeProvider } from '@mui/material';
import { BrowserRouter } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from 'react-query';
import { ReactQueryDevtools } from 'react-query/devtools';

import { customTheme } from './theme';
import AllRoutes from './Routes';

const queryClient = new QueryClient();

const App = () => {
  useEffect(() => {
    if (JSON.parse(localStorage.getItem('userFT')) === null)
      localStorage.setItem('userFT', true);
  }, []);

  return (
    <QueryClientProvider client={queryClient}>
      <ThemeProvider theme={customTheme}>
        <BrowserRouter>
          <AllRoutes />
        </BrowserRouter>
      </ThemeProvider>
      <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  );
};

export default App;
