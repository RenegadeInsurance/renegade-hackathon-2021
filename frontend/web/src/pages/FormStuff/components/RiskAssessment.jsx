import { useEffect, useState } from 'react';
import axios from 'axios';

const manageQuestion = (data, setQuestion, setCurrentQuestion) => {
  const question = Object.keys(data)[0];
  setCurrentQuestion(question);
  setQuestion(data[question]);
};

const RiskAssessment = ({ formData, handleFormData, setFormData }) => {
  const [question, setQuestion] = useState({});
  const [currentQuestion, setCurrentQuestion] = useState('');

  const [contactDetails, setContactDetails] = useState({});

  const handle = (e) => {
    setContactDetails({ ...contactDetails, [e.target.name]: e.target.value });
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
      <h1>Add Contact</h1>
      <input
        type='text'
        placeholder={'phonenumbers , separated'}
        name={'phonenumbers'}
        onChange={handleFormData}
      />
      <hr />
    </>
  );
};

export default RiskAssessment;
