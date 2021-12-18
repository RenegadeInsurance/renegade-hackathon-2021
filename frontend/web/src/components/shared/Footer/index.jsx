import { Box, Container, Divider } from '@mui/material';

const Footer = () => {
  return (
    <>
      <Divider />
      <Container>
        <Box textAlign='center' paddingTop={2} paddingBottom={2}>
          WeatherX &copy; {new Date().getFullYear()}
        </Box>
      </Container>
    </>
  );
};

export default Footer;
