import Head from 'next/head';
import Image from 'next/image';
import React, { useState } from 'react';
import styles from '../styles/Home.module.css';
import Block, { InputField } from '../comp/form-block';

// layout for the admin page
import Admin from '../layouts/Admin.js';

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
    if (key === 'model') {
      newQuestions.answers[index] = value;
    } else {
      newQuestions.answers[index][key] = value;
    }
    setQuestion(newQuestions);
  };

  const saveQuestion = e => {
    e.preventDefault();
    const tempQuestions = { ...question };
    fetch('api/question', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(question),
    })
      .then(response => response.json())
      .then(response => {
        window.location.reload();
      });
  };

  return (
    <>
      <div className="container pb-5">
        <div className="card p-5 p-xs-2">
          <h1 className="card-title">Create A Question</h1>
          <form onSubmit={saveQuestion}>
            <div className="row">
              <div className="col-md-12">
                <InputField
                  name="question"
                  label="Question"
                  onChangeAction={e => updateQuestion('question', e)}
                />
              </div>
              <div className="col-md-3">
                <InputField
                  type="range"
                  name="weight"
                  label="Probability Factor"
                  min="0"
                  max="100"
                  onChangeAction={e => updateQuestion('weight', e)}
                />
              </div>
            </div>
            <div className="row">
              <h3>Choices</h3>
            </div>
            <div className="row">
              {question.answers.map((item, i) => {
                return (
                  <>
                    <div
                      key={`${i}`}
                      className="col-md-4 mb-2 stretch-card transparent"
                    >
                      <div className="card">
                        <div className="card-body">
                          <fieldset key="answer_${i}">
                            <div className="form-group">
                              {/* <label className='text-black'>Option {i + 1}</label> */}
                              <InputField
                                key={`choice_${i}`}
                                name={`Choice ${i + 1}`}
                                label=""
                                value={item.weight}
                                onChangeAction={e => {
                                  updateAnswer('answer', e.target.value, i);
                                }}
                              />
                            </div>
                            <div className="form-group">
                              <label className="text-black">
                                {'Impact Scale(Low to High)'}{' '}
                                {`(${item.value || 0})`}
                              </label>
                              <InputField
                                type="range"
                                key={`weight_${i}`}
                                name={`weight_${i}`}
                                label="Impact Scale(Low to High)"
                                min="0"
                                max="100"
                                onChangeAction={e => {
                                  updateAnswer('weight', e.target.value, i);
                                }}
                              />
                            </div>
                          </fieldset>
                        </div>
                      </div>
                    </div>
                  </>
                );
              })}
            </div>
            <div className="template-demo pb-2">
              <button
                type="button"
                className="btn btn-outline-primary btn-fw"
                onClick={addOption}
              >
                Add Choices
              </button>
            </div>
            <hr />
            <div className="template-demo">
              <button type="submit" className="btn btn-outline-success btn-fw">
                Save Question
              </button>
            </div>
          </form>
          <pre>{JSON.stringify(question, null, 2)}</pre>
        </div>
      </div>
    </>
  );
}

Home.layout = Admin;
