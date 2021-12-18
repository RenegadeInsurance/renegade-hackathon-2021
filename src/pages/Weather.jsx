import React, {useEffect, useState} from "react";
import { Card, Spin } from 'antd';
import { List, Avatar } from 'antd';
import { LoadingOutlined } from '@ant-design/icons';
import { fetchCurrentWeather } from "../services/weatherapi";

const Weather = (activeTabKey) => {
  const [ weather, setWeather ] = useState(null);

  const antIcon = <LoadingOutlined style={{ fontSize: 24 }} spin />;

  useEffect(()=>{
    fetchCurrentWeather("ktm").then(data=> setWeather(data))
  }, []) 
  const { location, current } = weather || {location: null, current:null};
  return (
    <React.Fragment>
      <h1>Weather</h1>
    { !weather ? <Spin indicator={antIcon} /> :
    <div>
        <Card style={{ width: 300 }}>
          <p>{ location.region }, { location.country }</p>
          <p>{ current.temp_c } <sup>o</sup>c </p>
          <p>{ current.condition.text } <img src={current.condition.icon} /> </p>
        </Card>
    </div>
    }
    </React.Fragment>
  )
}

export default Weather;
