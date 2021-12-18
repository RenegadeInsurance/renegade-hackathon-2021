import { useState } from 'react';
import { Box, Skeleton, Typography } from '@mui/material';
import { makeStyles } from '@mui/styles';
import { useQuery } from 'react-query';

import { getSignals } from './../api';

const useStyles = makeStyles({
  singleSignal: {
    display: `inline-block`,
    margin: `auto`,
    textAlign: `center`,
  },
});

const Signals = () => {
  const classes = useStyles();

  const { data, isLoading, error, refetch } = useQuery(
    ['getSignal', { locName: 'kathmandu' }],
    getSignals
  );

  console.log(data);

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
          {isLoading ? (
            <Skeleton />
          ) : (
            <>
              <Box className={classes.singleSignal}>
                <Typography>{data.current.humidity}%</Typography>
                <Typography>Humidity</Typography>
              </Box>

              <Box className={classes.singleSignal}>
                <Typography>{data.current.vis_km}km</Typography>
                <Typography>Visibility</Typography>
              </Box>

              <Box className={classes.singleSignal}>
                <Typography>{data.current.uv}</Typography>
                <Typography>UV Index</Typography>
              </Box>
            </>
          )}
        </Box>
      </Box>
    </>
  );
};

export default Signals;
