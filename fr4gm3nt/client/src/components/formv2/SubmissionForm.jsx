import { List, Typography, Divider } from "antd";
import { fetchSubmissionFormById } from "../../services/api";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";

const { Title } = Typography;

const SubmissionForm = () => {
  const { id } = useParams();
  const [submission, setSubmission] = useState(null);
  useEffect(() => {
    fetchSubmissionFormById(id).then((data) => {
      setSubmission({ data });
    });
  }, []);
  return (
    <>
      {!submission ? (
        <Title>loading</Title>
      ) : (
        <>
          <Divider orientation="left">
            <Title>{submission.data.formName}</Title>
          </Divider>
          <Title level={3}> General Details </Title>
          {submission.data.generalDetails.map((data) => (
            <p>
              {data.label} - {data.value}
            </p>
          ))}
          <Title level={3}> Risk Results </Title>
          {submission.data.riskResults.map((data) => (
            <p>
              {data.riskTitle} - {data.riskFactor}
            </p>
          ))}
        </>
      )}
    </>
  );
};

export default SubmissionForm;
