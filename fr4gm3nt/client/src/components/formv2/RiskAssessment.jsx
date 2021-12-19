import { useState, useEffect } from "react";
import { Select, Typography } from "antd";
import { test } from "./test";
const { Option } = Select;

const { Title } = Typography;

const RiskAssessment = (data) => {
  const riskData = data.data;
  // const riskData = test.riskSection[0];
  const [risk, setRisk] = useState(riskData.data);
  const [qns, setQns] = useState({
    label: risk.label,
    answer: null,
    riskIf: risk.riskIf,
    riskLevel: risk.riskLevel,
  });
  useEffect(() => {
    setRisk({ ...risk });
    setQns({ ...risk });
  }, []);
  console.log("QNS", qns);
  const [questions, setQuestions] = useState([qns]);
  const handleSelect = (value) => {
    let select = value === "yes" ? true : false;
    const child = risk.child.filter((d) => d.isYes === select);
    const obj = {
      answer: value,
      riskIf: risk.riskIf,
      riskLevel: risk.riskLevel,
      label: risk.label,
    };
    setQns({ ...qns, answer: value });
    setQuestions([...questions, ...child]);
    // console.log("Before risk", risk);
    // console.log(obj);
    console.log(questions);
    console.log("Filtered", ...child);
    // setQns([...qns, obj]);
    setRisk(...child);
    console.log("After risk", risk);
    console.log(`select ${value}`);
  };

  return (
    <div>
      <Title level={3}>{riskData.title}</Title>
      {questions.map((data) => (
        <h2>
          {data.label} - {data.answer}
        </h2>
      ))}
      {/* <h2>{qns.label}</h2> */}
      {/* <h2>{JSON.stringify(questions)}</h2> */}
      {/* <h2>{risk.label}</h2> */}
      {
        <Select defaultValue="" style={{ width: 120 }} onSelect={handleSelect}>
          <Option value="yes">Yes</Option>
          <Option value="no">No</Option>
        </Select>
      }
      {/* <h1>{JSON.stringify(risk)}</h1> */}
    </div>
  );
};

export default RiskAssessment;
