import { Typography, Box } from '@mui/material';
import { makeStyles } from '@mui/styles';
import Layout from 'components/shared/Layout';

const useStyles = makeStyles({
  radar: {
    width: `100%`,
    height: `80vh`,
    border: `none`,
  },
});

const RadarLiveView = () => {
  const classes = useStyles();

  return (
    <Layout>
      <Box my={2}>
        <Typography fontWeight='bold'>Powered by Ventusky</Typography>
      </Box>
      <iframe
        className={classes.radar}
        src='https://www.ventusky.com/'
        title='Radar view'
      ></iframe>
    </Layout>
  );
};

export default RadarLiveView;
