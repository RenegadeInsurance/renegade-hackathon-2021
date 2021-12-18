import { makeStyles } from '@mui/styles';
import Header from 'components/shared/Header';
import Footer from 'components/shared/Footer';
import { Container } from '@mui/material';

const useStyles = makeStyles({
  root: {
    minHeight: `100vh`,
    display: `flex`,
    flexDirection: `column`,
  },
  content: {
    flexGrow: 1,
  },
});

const Layout = ({ children }) => {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Header />
      <div className={classes.content}>
        <Container>{children}</Container>
      </div>
      <Footer />
    </div>
  );
};

export default Layout;
