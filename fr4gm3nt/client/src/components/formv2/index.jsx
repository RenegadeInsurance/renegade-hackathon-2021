import React, { useState, useEffect } from "react";
import { Form, Button, Select, Spin } from "antd";
import { useParams } from "react-router-dom";
import { LoadingOutlined } from "@ant-design/icons";
import { fetchDynamicFormById } from "../../services/api";
import { Builder } from "./Builder";
import RiskAssessment from "./RiskAssessment";


const { Option } = Select;
const antIcon = <LoadingOutlined style={{ fontSize: 24 }} spin />;

const FormView = () => {
  const { id } = useParams();
  const [form, setForm] = useState(null);
  const [riskData, setRiskData] = useState(null);

  useEffect(() => {
    fetchDynamicFormById(id).then((data) => {
      const generalSection = JSON.parse(data.generalSection);
      const riskSection = JSON.parse(data.riskSection);
      setRiskData(riskSection);
      setForm(generalSection);
    });
  }, [id]);

  console.log(riskData);

  const onFinish = (values) => {
    const noRisks = [];
    const riskDetails = [];
    form.forEach((data) => {
      data.fields.forEach((d) => {
        if (!d.isRiskIndicator) {
          noRisks[d.name.toLowerCase()] = values[d.name];
        } else {
          riskDetails.push({
            headingId: data.id,
            formId: d.id,
            answer: values[d.name],
          });
        }
      });
    });
    const result = { ...noRisks, riskDetails };
    // need to send to server
    console.log(result);
  };

  return (
    <React.Fragment>
      {form ? (
        <Form
          name="validate_other"
          onFinish={onFinish}
          initialValues={{}}
          layout="vertical"
        >
          <h1>{form.formName}</h1>
          {form.map((data) => (
            <div key={data.id}>
              <h1>{data.heading}</h1>
              <Builder fields={data.fields} />
            </div>
          ))}
          {riskData.map((data) =>
            Object.entries(data).length ? (
              <RiskAssessment data={{ ...data }} key={data} />
            ) : (
              <br />
            )
          )}
          <Form.Item>
            <Button type="primary" htmlType="submit">
              Submit
            </Button>
          </Form.Item>
        </Form>
      ) : (
        <Spin indicator={antIcon} />
      )}
    </React.Fragment>
  );
};

export default FormView;
