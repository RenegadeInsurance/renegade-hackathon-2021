import { Box, Grid, Typography, TextField } from '@mui/material';

const Location = () => {
  return (
    <>
      <Typography variant='h4' fontWeight='bold' mb={2}>
        Location
      </Typography>
      <Box>
        <Grid container spacing={2}>
          <Grid item xs={12} md={6}>
            <TextField
              type='text'
              label='Country'
              variant='outlined'
              size='small'
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <TextField
              type='text'
              label='State'
              variant='outlined'
              size='small'
            />
          </Grid>

          <Grid item md={12}>
            <TextField
              type='text'
              label='City'
              variant='outlined'
              size='small'
            />
          </Grid>
        </Grid>
      </Box>
    </>
  );
};

export default Location;
