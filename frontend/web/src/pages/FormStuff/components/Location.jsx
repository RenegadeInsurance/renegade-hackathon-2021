import { Box, Grid, Typography, TextField, Autocomplete } from '@mui/material';

const Location = ({ formData, handleFormData }) => {
  return (
    <>
      <Typography variant='h4' fontWeight='bold' mb={2}>
        Location
      </Typography>
      <Box>
        <Grid container spacing={2}>
          <Grid item xs={12} md={6}>
            <Autocomplete
              disablePortal
              options={country}
              sx={{ width: 300 }}
              renderInput={(params) => (
                <TextField {...params} label='Country' size='small' />
              )}
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <Autocomplete
              disablePortal
              options={state}
              sx={{ width: 300 }}
              renderInput={(params) => (
                <TextField {...params} label='State' size='small' />
              )}
            />
          </Grid>

          <Grid item md={12}>
            <Autocomplete
              disablePortal
              options={city}
              sx={{ width: 300 }}
              renderInput={(params) => (
                <TextField {...params} label='City' size='small' />
              )}
            />
          </Grid>
        </Grid>
      </Box>
    </>
  );
};

// Top 100 films as rated by IMDb users. http://www.imdb.com/chart/top
const state = [
  { label: 'State 1' },
  { label: 'State 2' },
  { label: 'State 3' },
  { label: 'State 4' },
  { label: 'State 5' },
  { label: 'State 6' },
  { label: 'State 7' },
];

const country = [
  { label: 'Country 1' },
  { label: 'Country 2' },
  { label: 'Country 3' },
  { label: 'Country 4' },
  { label: 'Country 5' },
  { label: 'Country 6' },
  { label: 'Country 7' },
];

const city = [
  { label: 'City 1' },
  { label: 'City 2' },
  { label: 'City 3' },
  { label: 'City 4' },
  { label: 'City 5' },
  { label: 'City 6' },
  { label: 'City 7' },
];

export default Location;
