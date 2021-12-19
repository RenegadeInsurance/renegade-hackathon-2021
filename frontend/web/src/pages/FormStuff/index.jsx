import React from 'react';
import {
  Paper,
  Box,
  Button,
  Stepper,
  Step,
  StepLabel,
  StepContent,
  Typography,
  Snackbar,
  Alert
} from '@mui/material';
import Layout from 'components/shared/Layout';
import axios from 'axios';

const PersonalDetail = React.lazy(() => import('./components/PersonalDetail'));
const Location = React.lazy(() => import('./components/Location'));
const RiskAssessment = React.lazy(() => import('./components/RiskAssessment'));

const FormStuff = () => {
  const [open, setOpen] = React.useState(false);
  const [activeStep, setActiveStep] = React.useState(0);
  const [formData, setFormData] = React.useState({
    name: '',
    email: '',
    phonenumbers: '',
    age: 0,
    date_of_birth: '',
    biological_gender: 'Female',
    country: 'Nepal',
    state: 'Bagmati',
    city: 'Kathmandu',
    relative: [],
  });

  const handleNext = () => {
    setActiveStep((prevActiveStep) => prevActiveStep + 1);
  };

  const handleBack = () => {
    setActiveStep((prevActiveStep) => prevActiveStep - 1);
  };

  const handleReset = () => {
    setActiveStep(0);
  };

  const handleClose = (event, reason) => {
    if (reason === 'clickaway') {
      return;
    }

    setOpen(false);
  };

  const handleFormData = (e) => {
    setFormData((prevState) => ({
      ...prevState,
      [e.target.name]: e.target.value,
    }));
  };

  const steps = [
    {
      title: 'Personal Detail',
      component: (
        <PersonalDetail formData={formData} handleFormData={handleFormData} />
      ),
    },
    {
      title: 'Location',
      component: (
        <Location formData={formData} handleFormData={handleFormData} />
      ),
    },
    {
      title: 'Risk Assessment',
      component: (
        <RiskAssessment
          formData={formData}
          setFormData={setFormData}
          handleFormData={handleFormData}
        />
      ),
    },
  ];
  return (
    <Layout>
      <Snackbar open={open} autoHideDuration={6000} onClose={handleClose}>
        <Alert onClose={handleClose} severity="success" sx={{ width: '100%' }}>
          Done! Thank you!
        </Alert>
      </Snackbar>
      <Box sx={{ width: `100%` }}>
        <Stepper activeStep={activeStep} orientation='vertical'>
          {steps.map((step, index) => (
            <Step key={step.title}>
              <StepLabel
                optional={
                  index === 2 ? (
                    <Typography variant='caption'>Last step</Typography>
                  ) : null
                }
              >
                {step.label}
              </StepLabel>
              <StepContent>
                <Box>{step.component}</Box>
                <Box sx={{ mb: 2 }}>
                  <div>
                    <Button
                      variant='contained'
                      onClick={handleNext}
                      sx={{ mt: 1, mr: 1 }}
                    >
                      {index === steps.length - 1 ? 'Finish' : 'Continue'}
                    </Button>
                    <Button
                      disabled={index === 0}
                      onClick={handleBack}
                      sx={{ mt: 1, mr: 1 }}
                    >
                      Back
                    </Button>
                  </div>
                </Box>
              </StepContent>
            </Step>
          ))}
        </Stepper>
        {activeStep === steps.length && (
          <Paper square elevation={0} sx={{ p: 3 }}>
            <Typography>All steps completed - you&apos;re finished</Typography>
            <Button onClick={handleReset} sx={{ mt: 1, mr: 1 }}>
              Reset
            </Button>
            <Button
              sx={{ mt: 1, mr: 1 }}
              onClick={(e) => {
                e.preventDefault();
                axios
                  .post(
                    'http://localhost:8000/api/alert-management/register-for-notification/',
                    formData
                  )
                  .then((resp) => {
                    console.log(resp);
                    setOpen(true)
                  })
                  .catch((resp) => {
                    console.log(resp);
                  });
              }}
            >
              Submit
            </Button>
          </Paper>
        )}
      </Box>
    </Layout>
  );
};

export default FormStuff;
