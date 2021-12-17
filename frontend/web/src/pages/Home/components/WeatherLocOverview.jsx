import { Box, Typography } from '@mui/material';

const WeatherLocOverview = ({ location, temp, weatherType }) => {
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
        <div>
          <Box margin={0} p={0}>
            <Typography fontSize='2rem'>{location}</Typography>
          </Box>
          <Box margin={0} p={0}>
            <Typography fontSize='7rem'>{temp}°</Typography>
          </Box>
        </div>

        <div>
          <Box sx={{ transform: `rotate(270deg)`, fontSize: `1.5rem` }}>
            {weatherType}
          </Box>
        </div>
      </Box>
    </>
  );
};

export default WeatherLocOverview;
