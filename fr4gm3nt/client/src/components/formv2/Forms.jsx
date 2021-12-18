import React, { useState, useEffect } from "react";
import { Card, Col, Form, Button, Row, Typography } from "antd";
import { Link,  } from "react-router-dom"
import { fetchDynamicForm } from "../../services/api";
import { Builder } from "./Builder";

const { Title } = Typography;

const Forms = () => {
  const [ forms, setForms ] = useState([]);
  useEffect(() => {
    fetchDynamicForm().then( data => {
      setForms([...data])
    });
  }, []);

  return (
    <React.Fragment>
      {
        forms.length ? 
        (
          <div className="site-card-wrapper">
            <Title> Available Form </Title>
            <Row gutter={16}>
              {
                forms.map(data => (
                  <Col span={24} style={{margin: '1em'}} key={data.id}>
                    <Link to={`/forms/${data.id}`} >
                    <Card title={data.formName} bordered={true}>
                      <em> Created on: </em>{data.createdDate}
                    </Card>
                  </Link>
                  </Col>
                ))
              }
            </Row>
          </div>
      ) : 
        (
        <h1>Loading...</h1>
        )
      }
    </ React.Fragment>
  );
};

export default Forms;
