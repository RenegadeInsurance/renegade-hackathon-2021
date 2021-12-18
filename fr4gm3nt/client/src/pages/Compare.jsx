import { useState, useEffect } from 'react';
import { Button, Form, Input, Table } from 'antd';
import { fetchCurrentWeather } from "../services/weatherapi";

const columns = [
  {
    title: 'City',
    dataIndex: 'city',
  },
  {
    title: 'Temperature',
    dataIndex: 'temp',
  },
  {
    title: 'Cloud',
    dataIndex: 'cloud',
  },
  {
    title: 'Humidity',
    dataIndex: 'humidity',
  },
  {
    title: 'Wind Direction',
    dataIndex: 'wind_dir',
  },
  {
    title: 'Wind KPH',
    dataIndex: 'wind_kph',
  },
];

const Compare = () => {
  const [ weather, setWeather ] = useState(null);
  const [ weatherData, setweatherData ] = useState([]);
  useEffect(() => {
     
  }, [])
  const data = [];
  console.log("datatatata", weatherData)
  const onFinish = (values) => {
    const location = values.search;
    fetchCurrentWeather(location).then(d => {
      const { location, current } = d;
      const obj = {
        city: location.region,
        temp: current.temp_c,
        humidity: current.humidity,
        wind_dir: current.wind_dir,
        wind_kph: current.wind_kph,
        cloud: current.condition.text
      }
        setweatherData([...weatherData, obj])
      console.log("Weather", weatherData)
    })
    console.log('Success:', values);
  };

  const onFinishFailed = (errorInfo) => {
    console.log('Failed:', errorInfo);
  };
  return (
    <div>
      <Form
      name="basic"
      initialValues={{ remember: true }}
      onFinish={onFinish}
      onFinishFailed={onFinishFailed}
      autoComplete="off"
    >
      <Form.Item name="search">
      <Input placeholder="Enter location" />
    </Form.Item>
      <Form.Item style={{marginTop: '2rem'}}>
        <Button type="primary" htmlType="submit">
          Submit
        </Button>
      </Form.Item>
    </Form>
    <Table columns={columns} dataSource={weatherData} />
  </div>)
}

export default Compare;
