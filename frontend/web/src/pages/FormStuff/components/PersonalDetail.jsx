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

const PersonalDetail = ({ formData, handleFormData }) => {
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
              variant='outlined'
              size='small'
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <TextField
              type='email'
              label='Email'
              variant='outlined'
              size='small'
            />
          </Grid>

          <Grid item xs={12} md={6}>
            <TextField
              type='number'
              label='Age'
              variant='outlined'
              size='small'
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <FormControl component='fieldset'>
              <FormLabel component='legend'>Gender</FormLabel>
              <RadioGroup
                aria-label='gender'
                defaultValue='female'
                name='radio-buttons-group'
              >
                <Box sx={{ display: `flex` }}>
                  <FormControlLabel
                    value='female'
                    control={<Radio />}
                    label='Female'
                  />
                  <FormControlLabel
                    value='male'
                    control={<Radio />}
                    label='Male'
                  />
                  <FormControlLabel
                    value='other'
                    control={<Radio />}
                    label='Other'
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
