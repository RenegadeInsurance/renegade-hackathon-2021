import { useState } from 'react';
import { Container } from '@mui/material';
import { makeStyles } from '@mui/styles';
import BG_PlaceHolder from 'assets/bg_placeholder.jpg';

import Signals from 'pages/Home/components/Signals';
import WeatherLocOverview from 'pages/Home/components/WeatherLocOverview';

const useStyles = makeStyles({
  root: {
    background: `url(${BG_PlaceHolder}) no-repeat center center/cover`,
    minHeight: `100vh`,
    color: `#fff`,
    position: `relative`,
    display: `flex`,
    flexDirection: `column`,
    justifyContent: `space-between`,
    zIndex: 1,
    '&:before': {
      content: "''",
      width: `100%`,
      height: `100%`,
      position: `absolute`,
      top: 0,
      left: 0,
      background: `#333`,
      opacity: `.5`,
      zIndex: -1,
    },
  },
  singleSignal: {
    display: `inline-block`,
    margin: `auto`,
    textAlign: `center`,
  },
});

const Home = () => {
  const classes = useStyles();
  const [signals, setSignals] = useState([
    { title: 'Humidity', value: '63%' },
    { title: 'Visibility', value: '4km' },
    { title: 'UV Index', value: 'Low 0' },
  ]);
  const [temp, setTemp] = useState(19);
  const [location, setLocation] = useState(`Nepal`);
  const [weatherType, setWeatherType] = useState(`Sunny Day`);

  return (
    <div className={classes.root}>
      <Container>
        <WeatherLocOverview
          temp={temp}
          weatherType={weatherType}
          location={location}
        />
      </Container>

      <Container sx={{ textAlign: `center` }}>
        <Signals signals={signals} />
      </Container>
    </div>
  );
};

export default Home;
