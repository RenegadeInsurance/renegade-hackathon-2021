import { ThemeProvider } from '@mui/material';
import { BrowserRouter } from 'react-router-dom';
import { customTheme } from './theme';
import AllRoutes from './Routes';

const App = () => {
  return (
    <ThemeProvider theme={customTheme}>
      <BrowserRouter>
        <AllRoutes />
      </BrowserRouter>
    </ThemeProvider>
  );
};

export default App;
