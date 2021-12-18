import { useState } from 'react';
import { Box, Typography, Skeleton, useMediaQuery } from '@mui/material';
import { useTheme } from '@mui/material/styles';
import { makeStyles } from '@mui/styles';
import { useQuery } from 'react-query';

import { getWeather } from './../api';
import getLoc from 'utils/getLoc';

const useStyles = makeStyles({
  customInput: {
    margin: 0,
    background: `transparent`,
    border: `none`,
    fontSize: `1.9rem`,
    width: `11rem`,
    color: `#fff`,

    '&:focus': {
      outline: `none`,
      border: `none`,
    },
  },
});

const WeatherLocOverview = ({ location, temp, weatherType }) => {
  const classes = useStyles();
  const theme = useTheme();
  const matches = useMediaQuery(theme.breakpoints.up('sm'));

  const { data, isLoading, error, refetch } = useQuery(
    ['getWeather', { locName: 'kathmandu' }],
    getWeather
  );

  console.log(data);

  return (
    <>
      <Box
        sx={{
          display: `flex`,
          justifyContent: `space-between`,
          alignItems: `center`,
          marginTop: `2rem`,
        }}
      >
        {isLoading ? (
          <Skeleton />
        ) : (
          <div>
            <Box margin={0} p={0}>
              <input
                type='text'
                className={classes.customInput}
                value={data.location.name}
              />
            </Box>
            <Box margin={0} p={0}>
              <Typography fontSize='7rem'>{data.current.temp_c}°</Typography>
            </Box>
          </div>
        )}

        {isLoading ? (
          <p>Loading...</p>
        ) : (
          <div>
            <Box
              sx={{
                transform: `${!matches && `rotate(270deg)`}`,
                fontSize: `1.5rem`,
              }}
            >
              {data.current.condition.text}
            </Box>
          </div>
        )}
      </Box>
    </>
  );
};

export default WeatherLocOverview;
