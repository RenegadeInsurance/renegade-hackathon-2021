import {Box, Grid, Typography, TextField, Autocomplete} from '@mui/material';

const Location = ({formData, handleFormData}) => {
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
              sx={{width: 300}}
              name={"country"}
              value={formData.country}
              renderInput={(params) => (
                <TextField {...params} label='Country' size='small'/>
              )}
              onChange={(e) => {
                e.target.value = e.target.innerText
                handleFormData(e)
              }}
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <Autocomplete
              disablePortal
              options={state}
              sx={{width: 300}}
              name={"state"}
              value={formData.state}
              renderInput={(params) => (
                <TextField {...params} label='State' size='small'/>
              )}
              onChange={(e) => {
                e.target.value = e.target.innerText
                handleFormData(e)
              }}
            />
          </Grid>

          <Grid item md={12}>
            <Autocomplete
              disablePortal
              options={city}
              sx={{width: 300}}
              name={"city"}
              value={formData.city}
              onChange={(e) => {
                e.target.value = e.target.innerText
                handleFormData(e)
              }}
              renderInput={(params) => (<TextField {...params} label='City' size='small'/>)}
            />
          </Grid>
        </Grid>
      </Box>
    </>
  );
};

// Top 100 films as rated by IMDb users. http://www.imdb.com/chart/top
const state = [
  "Bagmati"
];

const country = [
  'Nepal'
];

const city = [
  'Kathmandu',
  'Bhaktapur',
  'Lalitpur',
];

export default Location;
