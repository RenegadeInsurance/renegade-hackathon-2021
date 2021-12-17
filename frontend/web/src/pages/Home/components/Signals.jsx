import { Box, Typography } from '@mui/material';
import { makeStyles } from '@mui/styles';

const useStyles = makeStyles({
  singleSignal: {
    display: `inline-block`,
    margin: `auto`,
    textAlign: `center`,
  },
});

const Signals = ({ signals }) => {
  const classes = useStyles();
  return (
    <>
      <Box sx={{ marginBottom: `5rem` }}>
        <Box
          sx={{
            display: `flex`,
            justifyContent: `space-around`,
            border: `2px solid #fff`,
            maxWidth: `40rem`,
            margin: `auto`,
            padding: `1rem .5rem`,
            borderRadius: `1rem`,
          }}
        >
          {signals.map((signal, index) => (
            <Box key={index} className={classes.singleSignal}>
              <Typography>{signal.value}</Typography>
              <Typography>{signal.title}</Typography>
            </Box>
          ))}
        </Box>
      </Box>
    </>
  );
};

export default Signals;
