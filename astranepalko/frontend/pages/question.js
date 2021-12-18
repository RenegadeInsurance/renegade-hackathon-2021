import Head from 'next/head';
import Image from 'next/image';
import React, { useState } from 'react';
import styles from '../styles/Home.module.css';
import Block, { InputField } from '../comp/form-block';

export default function Home() {
  const questionStruct = {
    id: null,
    question: '',
    weight: null,
    answers: [
      {
        id: null,
        answer: '',
        weight: '',
      },
    ],
  };
  const [question, setQuestion] = useState({ ...questionStruct });

  const addOption = e => {
    e.preventDefault();
    const newQuestions = { ...question };
    newQuestions.answers.push(questionStruct.answers[0]);
    setQuestion(newQuestions);
  };

  const updateQuestion = (key, evt) => {
    const newQuestions = { ...question };
    newQuestions[key] = evt.target.value;
    setQuestion(newQuestions);
  };

  const updateAnswer = (key, value, index) => {
    const newQuestions = { ...question };
    if (key === "model") {
      newQuestions.answers[index] = value;
    } else {
      newQuestions.answers[index][key] = value;
    }
      setQuestion(newQuestions);
  };

  const saveQuestion = (e) => {
    e.preventDefault();
    const tempQuestions = {...question};
    tempQuestions.answers = question.answers.map((answer, index) => {
      if (!answer.id) {
        answer.id = saveAnswer(index, )
      }
      return {
        id: answer.id
      };
    });
    fetch('http://localhost:3001/questions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(tempQuestions)
    })
      .then(response => response.json())
      .then(response => {
        // window.location.reload();
      });
  };

  const saveAnswer = (index, callback) => {
    fetch('http://localhost:3001/answers', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(question.answers[index])
    })
      .then(response => response.json())
      .then(response => {
        updateAnswer("model", response, index)
        callback(answer);
      });
  };
  return (
    <div className="container">
      <div className="card">
        <form onSubmit={saveQuestion}>
          <div>
            <InputField
              name="question"
              label="Question"
              onChangeAction={e => updateQuestion('question', e)}
            />
            <InputField
              type="range"
              name="weight"
              label="Probability Factor"
              min="0"
              max="100"
              onChangeAction={e => updateQuestion('weight', e)}
            />
          </div>
          <div>
            {question.answers.map((item, i) => {
              return (
                <>
                  <fieldset key="answer_${i}">
                    <label>Choice {i + 1}</label>
                    <InputField
                      key={`choice_${i}`}
                      name={`choice_${i}`}
                      label="New Choice"
                      value={item.weight}
                      onChangeAction={e => {
                        updateAnswer('answer', e.target.value, i);
                      }}
                    />
                    <InputField
                      type="range"
                      key={`weight_${i}`}
                      name={`weight_${i}`}
                      label="Probability Factor"
                      min="0"
                      max="100"
                      onChangeAction={e => {
                        updateAnswer('weight', e.target.value, i);
                      }}
                    />
                  </fieldset>
                </>
              );
            })}
            <button onClick={addOption}>Add Choices</button>
          </div>
          <button>Save Question</button>
        </form>
        <pre>{JSON.stringify(question, null, 2)}</pre>
      </div>
    </div>
  );
}
