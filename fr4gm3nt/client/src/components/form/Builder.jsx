import React from "react";
import { Input, Form, Select } from "antd";
const { Option } = Select;

export const Builder = ({ fields }) => {
  return fields.map((data) => {
    switch (data.type) {
      case "input":
        return (
            <Form.Item
              label={data.name}
              name={data.name}
              rules={[{ required: true, message: `Please input your ${data.name}!` }]}
            >
              <Input />
            </Form.Item>
        );
      case "dropdown":
        return (
            <Form.Item
              name={data.name}
              label={data.name}
              rules={[{ required: true }]}
            >
              <Select placeholder={data.placeholder} onChange={this} allowClear>
                {data.values.map((data) => (
                  <Option value={data} key={data}>
                    {data}
                  </Option>
                ))}
              </Select>
            </Form.Item>
        );
      default:
        <>blank</>;
    }
  });
};
