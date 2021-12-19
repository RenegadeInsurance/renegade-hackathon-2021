import React, { useState, useEffect } from "react";
import { Form, Button } from "antd";

import { fetchForm } from "../../services/api";
import { Builder } from "./Builder";


const FormView = () => {
  const [form, setForm] = useState(null);
  useEffect(() => {
    fetchForm().then((data) => {
      setForm(data);
    });
  }, []);

  const onFinish = (values) => {
    const noRisks = []
    const riskDetails = []
    form.formData.map(data=>{
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
          {form.formData.map((data) => {
            return (
              <div key={data.id}>
                <h1>{data.heading}</h1>
                <Builder fields={data.fields} />
              </div>
            );
          })}
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
