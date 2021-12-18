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

const WeatherLocOverview = ({ loc, handleChange }) => {
  const classes = useStyles();
  const theme = useTheme();
  const matches = useMediaQuery(theme.breakpoints.up('sm'));

  const [tempState, setTempState] = useState(loc);

  const { data, isLoading, error, refetch } = useQuery(
    ['getWeather', { locName: loc }],
    getWeather
  );

  const handleInput = (e) => {
    setTempState(e.target.value);
  };

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
          <Skeleton variant='rectangular' width={210} height={118} />
        ) : (
          <div>
            <Box margin={0} p={0}>
              <form
                onSubmit={(e) => {
                  handleChange(tempState);
                  e.preventDefault();
                }}
              >
                <input
                  type='text'
                  className={classes.customInput}
                  value={tempState}
                  onChange={handleInput}
                  style={{ textTransform: 'capitalize' }}
                />
              </form>
            </Box>
            <Box margin={0} p={0}>
              <Typography fontSize='7rem'>{data.current.temp_c}°</Typography>
            </Box>
          </div>
        )}

        {isLoading ? (
          <Skeleton variant='rectangular' width={150} height={150} />
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
