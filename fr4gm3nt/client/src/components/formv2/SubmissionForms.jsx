import React, { useState, useEffect } from "react";
import { Card, Col, Row, Spin, Typography } from "antd";
import { Link } from "react-router-dom";
import { fetchSubmissionFormById } from "../../services/api";
import { LoadingOutlined } from "@ant-design/icons";

const { Title } = Typography;
const antIcon = <LoadingOutlined style={{ fontSize: 24 }} spin />;

const Forms = () => {
  const [submissions, setSubmissions] = useState(null);
  useEffect(() => {
    fetchSubmissionFormById().then((data) => {
      console.log("Submissions", data);
      setSubmissions([...data]);
    });
  }, []);

  return (
    <React.Fragment>
      {JSON.stringify(submissions)}
      {submissions.length ? (
        <div className="site-card-wrapper">
          <Title> Available Forms </Title>
          <Row gutter={16}>
            {submissions.map((data) => (
              <Col span={24} style={{ margin: "1em" }} key={data.id}>
                <Link to={`/forms/${data.id}`}>
                  <Card title={data.formName} bordered={true}>
                    <em> Created on: </em>
                    {data.createdDate}
                  </Card>
                </Link>
              </Col>
            ))}
          </Row>
        </div>
      ) : (
        <Spin indicator={antIcon} />
      )}
    </React.Fragment>
  );
};

export default Forms;
