import React, { useState, useEffect } from "react";
import { Form, Button, Select } from "antd";
import { useNavigate, useParams } from "react-router-dom";
import { fetchDynamicFormById } from "../../services/api";
import { Builder } from "./Builder";

const { Option } = Select;

const FormView = () => {
  const { id } = useParams();
  const [ form, setForm ] = useState(null);
  const [ riskData, setRiskData] = useState(null);

  useEffect(() => {
    fetchDynamicFormById(id).then((data) => {
      const generalSection = JSON.parse(data.generalSection)
      const riskSection = JSON.parse(data.riskSection)
      setRiskData(riskSection);
      setForm(generalSection);
    });
  }, []);

  console.log(riskData)

  function handleChange(value) {
    console.log(`selected ${value}`);
  }

  const onFinish = (values) => {
    const noRisks = []
    const riskDetails = []
    form.map(data => {
      data.fields.map(d => {
      if (!d.isRiskIndicator) 
      {
        noRisks[d.name.toLowerCase()] = values[d.name]
      } 
      else {
        riskDetails.push({headingId:data.id, formId: d.id, answer: values[d.name]})
      }
    })
    })
    const result = {...noRisks, riskDetails}
    // need to send to server
    console.log(result)
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
          {
            form.map((data) => 
            (
              <div key={data.id}>
                <h1>{data.heading}</h1>
                <Builder fields={data.fields} />
              </div>
            )
          )}
        {
          riskData.map(data => 
            (Object.entries(data).length?
              <div>
              <h1>{data.title}</h1>
              <h2>{data.data.label}</h2>
              <Select defaultValue="--" style={{ width: 120 }} onChange={handleChange}>
                <Option value="yes">Yes</Option>
                <Option value="no">No</Option>
              </Select>
              </div>: <br/>

            )
          )
        }
          <Form.Item>
            <Button type="primary" htmlType="submit">
              Submit
            </Button>
          </Form.Item>
        </Form>
      ) : (
        <h1>Loading...</h1>
      )}
    </React.Fragment>
  );
};

export default FormView;
