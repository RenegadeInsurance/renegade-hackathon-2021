import { Box } from '@mui/system';
import { LinearProgress } from '@mui/material';

const Loading = () => {
  return (
    <div>
      <LinearProgress color='primary' />
      <Box
        sx={{
          position: `fixed`,
          width: `100%`,
          height: `100%`,
          left: 0,
          top: 0,
          display: `flex`,
          justifyContent: `center`,
          alignItems: `center`,
        }}
      >
        <h1>Loading...</h1>
      </Box>
    </div>
  );
};

export default Loading;
