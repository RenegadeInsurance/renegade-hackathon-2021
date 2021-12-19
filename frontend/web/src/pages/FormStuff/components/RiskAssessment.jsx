import { useEffect, useState } from 'react';
import axios from 'axios';
import { Box, TextField, Button } from '@mui/material';

const manageQuestion = (data, setQuestion, setCurrentQuestion) => {
  const question = Object.keys(data)[0];
  setCurrentQuestion(question);
  setQuestion(data[question]);
};

const RiskAssessment = ({ formData, handleFormData, setFormData }) => {
  const [question, setQuestion] = useState({});
  const [currentQuestion, setCurrentQuestion] = useState('');
  const [alertGroup, setAlertGroup] = useState({
    name: '',
    email: '',
    phone_number: '',
    relationship: '',
  });
  const [contactDetails, setContactDetails] = useState({});

  const handle = (e) => {
    setContactDetails((prevState) => ({
      ...prevState,
      [e.target.name]: e.target.value,
    }));

    setAlertGroup((prevState) => ({
      ...prevState,
      [e.target.name]: e.target.value,
    }));
  };

  useEffect(() => {
    axios
      .get(
        'http://localhost:8000/api/risk-management/get-questions-dict/flooding/'
      )
      .then((resp) => {
        const questions = resp.data[0]['questions'];
        manageQuestion(questions, setQuestion, setCurrentQuestion);
      });
  }, []);

  const hidden =
    currentQuestion === 'Low Risk' ||
    currentQuestion === 'Moderate Risk' ||
    currentQuestion === 'Minimal Risk' ||
    currentQuestion === 'High Risk';

  return (
    <>
      <h1>Risk Assessment Detail</h1>
      <p>{currentQuestion}</p>
      <button
        disabled={hidden}
        onClick={() => {
          setQuestion((prevState) => {
            const newState = prevState['Yes'];
            if (typeof newState === 'string') {
              setCurrentQuestion(newState);
              setFormData((prev) => {
                return { ...prev, risk_amount: prevState };
              });
            } else {
              manageQuestion(newState, setQuestion, setCurrentQuestion);
              return newState;
            }
          });
        }}
      >
        YES
      </button>
      <button
        disabled={hidden}
        onClick={() => {
          setQuestion((prevState) => {
            const newState = prevState['No'];
            if (typeof newState === 'string') {
              setCurrentQuestion(newState);
              setFormData((prev) => {
                return { ...prev, risk_amount: prevState };
              });
            } else {
              manageQuestion(newState, setQuestion, setCurrentQuestion);
              return newState;
            }
          });
        }}
      >
        NO
      </button>
      <hr />
      <h1>Alert Group</h1>
      <Box>
        <form
          onSubmit={(e) => {
            console.log(alertGroup);
            e.preventDefault();
            //http://localhost:8000/api/alert-management/register-alert-personnel/
            axios
              .post(
                `/api/alert-management/register-alert-personnel/`,
                alertGroup
              )
              .then((res) => {
                console.log(res.data);
                setFormData((prev) => ({
                  ...prev,
                  relative: [res.data.pk],
                }));
              })
              .catch((err) => {
                console.log(err);
              });
          }}
        >
          <TextField
            name='name'
            type='text'
            label='Name'
            variant='outlined'
            size='small'
            onChange={handle}
            value={alertGroup.name}
          />
          <br />
          <br />
          <TextField
            name='phone_number'
            type='tel'
            label='Phone number'
            variant='outlined'
            size='small'
            onChange={handle}
            value={alertGroup.phone_number}
          />
          <br />
          <br />
          <TextField
            name='relationship'
            type='text'
            label='Relationship'
            variant='outlined'
            size='small'
            onChange={handle}
            value={alertGroup.relationship}
          />
          <br />
          <br />
          <TextField
            name='email'
            type='email'
            label='Email'
            variant='outlined'
            size='small'
            onChange={handle}
            value={alertGroup.email}
          />
          <br></br>
          <br></br>
          <Button type='submit' variant='outlined'>
            Submit
          </Button>
        </form>
      </Box>
      <hr />
    </>
  );
};

export default RiskAssessment;
