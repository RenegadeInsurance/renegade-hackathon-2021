import { useEffect, useState } from 'react';
import {
  Heading,
  Link,
  useColorMode,
  Switch,
  Flex,
  Button,
  IconButton,
  Select,
  SelectField,
} from '@chakra-ui/react';
import { HamburgerIcon, CloseIcon } from '@chakra-ui/icons';
import NextLink from 'next/link';
import { useRouter } from 'next/router';
import ErrorPage from 'next/error';

export default function Home() {
  const router = useRouter();
  const [flowData, setFlowData] = useState([]);
  const [questions, setQuestions] = useState([]);
  const [fetchStatus, setFetchStatus] = useState(false);

  async function fetchFlow() {
    setFetchStatus(!fetchStatus);
    await fetch(`http://165.232.186.133/api/flows?_id=${router.query.ref}`)
      .then(resp => resp.json())
      .then(resp => {
        setFlowData([...resp.payload.data]);
      })
      .catch(e => console.log(e));
  }

  async function fetchAnswers(id, callback) {
    return await fetch(`http://165.232.186.133/api/answers?_id=${id}`)
      .then(resp => resp.json())
      .then(resp => {
        return resp.payload.data;
      })
      .catch(e => console.log(e));
  }

  const updateFlowData = (evt, answers) => {
    const newQuestions = [...questions];
    let selectedAnswer = answers.filter(
      answer => answer._id === evt.target.value
    )[0];
    newQuestions.push(selectedAnswer.next);
    newQuestions.filter(ques => {
      try{
        return ques.id === selectedAnswer.next._id
      }catch(e){
        return false;
      }
    })
    setQuestions([...newQuestions]);
    console.log(newQuestions, questions, selectedAnswer.next );
  };

  const resetQuestions = () => {
    setQuestions([]);
  }

  !fetchStatus && fetchFlow();

  return !!router.query.ref ? (
    <>
      <div className="container">
        <div className="row">
          <h2 className="h2">Form</h2>
          <hr />
        </div>
        <div className="row">
          <fieldset className="col-md-12">
            <legend>User Detail</legend>
            <div className="col-md-6">
              <label>First Name</label>
              <input type="text" name="fname" className="form-control" />
            </div>
          </fieldset>
        </div>
        {flowData.map(item => {
          return (
            <div key={item._id} className="row">
              <fieldset>
                <legend>{item.name}</legend>
                <div className="col-md-12">
                  <label>{item.question.question}</label>
                  <select
                    className="select form-control"
                    onChange={e => {
                      resetQuestions();
                      updateFlowData(e, item.question.answers_data);
                    }}
                  >
                    <option selected readOnly>
                      Select your Answer
                    </option>
                    {item.question.answers_data.map(answer => {
                      return (
                        <>
                          <option value={answer._id}>{answer.answer}</option>
                        </>
                      );
                    })}
                  </select>
                </div>
                {!!questions.length && questions.map(question => {
                  console.log(question);
                  return !!question ? (
                    <>
                      <div className="col-md-12">
                        <label>{question.question}</label>
                        <select
                          className="select form-control"
                          onChange={e =>
                            updateFlowData(e, question.answers_data)
                          }
                        >
                          <option selected readOnly>
                            Select your Answer
                          </option>
                          {question.answers_data.map(answer => {
                            return (
                              <>
                                <option value={answer._id}>
                                  {answer.answer}
                                </option>
                              </>
                            );
                          })}
                        </select>
                      </div>
                    </>
                  )
                  : (<></>);
                })}
              </fieldset>
            </div>
          );
        })}
        <pre>{JSON.stringify(flowData, null, 2)}</pre>
      </div>
    </>
  ) : (
    <ErrorPage statusCode={404} />
  );
}
