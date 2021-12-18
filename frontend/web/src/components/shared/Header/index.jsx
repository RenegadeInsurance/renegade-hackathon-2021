import {
  CssBaseline,
  AppBar,
  Toolbar,
  Typography,
  Box,
  Button,
} from '@mui/material';
import { Link } from 'react-router-dom';

const Header = () => {
  return (
    <>
      <CssBaseline />
      <AppBar>
        <Toolbar>
          <Box sx={{ flexGrow: 1 }}>
            <Typography variant='h4' component='div'>
              WeatherX
            </Typography>
          </Box>

          <Box sx={{ flexGrow: 0 }}>
            <Link to='/' style={{ textDecoration: `none`, color: `inherit` }}>
              <Button
                variant='contained'
                sx={{
                  background: `#fff`,
                  color: `#333`,
                  '&:hover': {
                    background: `#f4f4f4`,
                    color: `#333`,
                  },
                }}
              >
                Back to home
              </Button>
            </Link>
          </Box>
        </Toolbar>
      </AppBar>
      <Toolbar />
    </>
  );
};

export default Header;
