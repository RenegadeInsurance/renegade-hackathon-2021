import { useState } from 'react';
import { Container, Box } from '@mui/material';
import { makeStyles } from '@mui/styles';

import BG_PlaceHolder from 'assets/bg_placeholder.jpg';

import Signals from 'pages/Home/components/Signals';
import WeatherLocOverview from 'pages/Home/components/WeatherLocOverview';
import CustomSpeedDial from 'pages/Home/components/CustomSpeedDial';
import FiveDaysForecast from 'pages/Home/components/FiveDaysForecast';
import Footer from 'components/shared/Footer';

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
    overflowY: `auto`,
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

  return (
    <>
      <div className={classes.root}>
        <Container>
          <WeatherLocOverview />
        </Container>
        <Container sx={{ textAlign: `center` }}>
          <Signals />
        </Container>
        <Box sx={{ position: `fixed`, right: 0, bottom: 0, padding: `1rem` }}>
          <CustomSpeedDial />
        </Box>
      </div>

      <FiveDaysForecast />

      <Footer />
    </>
  );
};

export default Home;
