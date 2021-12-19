import {
  Box,
  Grid,
  Typography,
  TextField,
  Radio,
  RadioGroup,
  FormControlLabel,
  FormControl,
  FormLabel,
} from '@mui/material';

const PersonalDetail = ({formData, handleFormData}) => {
  return (
    <>
      <Typography variant='h4' fontWeight='bold' mb={2}>
        Personal Detail
      </Typography>
      <Box>
        <Grid container spacing={5}>
          <Grid item xs={12} md={6}>
            <TextField
              type='text'
              label='Name'
              name='name'
              variant='outlined'
              size='small'
              onChange={handleFormData}
              value={formData.name}
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <TextField
              type='email'
              name='email'
              label='Email'
              variant='outlined'
              size='small'
              onChange={handleFormData}
              value={formData.email}
            />
          </Grid>

          <Grid item xs={12} md={6}>
            <TextField
              type='date'
              label='Date Of Birth'
              name='date_of_birth'
              variant='outlined'
              size='small'
              onChange={handleFormData}
              value={formData.date_of_birth}
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <FormControl component='fieldset'>
              <FormLabel component='legend'>Biological Gender</FormLabel>
              <RadioGroup
                aria-label='gender'
                defaultValue='female'
                name='biological_gender'
                onChange={handleFormData}
                value={formData.biological_gender}
              >
                <Box sx={{display: `flex`}}>
                  <FormControlLabel
                    value='Female'
                    control={<Radio/>}
                    label='Female'
                  />
                  <FormControlLabel
                    value='Male'
                    control={<Radio/>}
                    label='Male'
                  />
                </Box>
              </RadioGroup>
            </FormControl>
          </Grid>
        </Grid>
      </Box>
    </>
  );
};

export default PersonalDetail;
