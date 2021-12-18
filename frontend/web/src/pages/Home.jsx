import { useState } from "react";
import {
  Box,
  Container,
  Divider,
  ListItemText,
  Typography,
} from "@mui/material";
import { makeStyles } from "@mui/styles";
import BG_PlaceHolder from "./../assets/bg_placeholder.jpg";
import List from "@mui/material/List";
import ListItem from "@mui/material/ListItem";
import ListItemIcon from "@mui/material/ListItemIcon";
import WbSunnyIcon from "@mui/icons-material/WbSunny";
import CloudIcon from "@mui/icons-material/Cloud";
import UmbrellaIcon from "@mui/icons-material/Umbrella";

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
    "&:before": {
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
  const signals = [
    { title: "Humidity", value: "63%" },
    { title: "Visibility", value: "4km" },
    { title: "UV Index", value: "Low 0" },
  ];
  const [temp, setTemp] = useState(19);
  const [location, setLocation] = useState(`Nepal`);
  const [weatherType, setWeatherType] = useState(`Sunny Day`);

  return (
    <>
      <div className={classes.root}>
        <Container>
          <Box
            sx={{
              display: `flex`,
              justifyContent: `space-between`,
              alignItems: `center`,
              marginTop: `2rem`,
            }}
          >
            <div>
              <Box margin={0} p={0}>
                <Typography fontSize="2rem">{location}</Typography>
              </Box>
              <Box margin={0} p={0}>
                <Typography fontSize="7rem">{temp}°</Typography>
              </Box>
            </div>

            <div>
              <Box sx={{ transform: `rotate(270deg)`, fontSize: `1.5rem` }}>
                {weatherType}
              </Box>
            </div>
          </Box>
        </Container>

        <Container sx={{ textAlign: `center` }}>
          <Box sx={{ marginBottom: `5rem` }}>
            <Box
              sx={{
                display: `flex`,
                justifyContent: `space-around`,
                border: `2px solid #fff`,
                maxWidth: `40rem`,
                margin: `auto`,
                padding: `1rem .5rem`,
                borderRadius: `1rem`,
              }}
            >
              {signals.map((signal, index) => (
                <Box key={index} className={classes.singleSignal}>
                  <Typography>{signal.value}</Typography>
                  <Typography>{signal.title}</Typography>
                </Box>
              ))}
            </Box>
          </Box>
        </Container>
      </div>
      <List>
        <ListItem>
          <ListItemText>Today</ListItemText>
          <ListItemIcon>
            <WbSunnyIcon />
          </ListItemIcon>
          <ListItemText>L: 4°</ListItemText>
          <ListItemText>H: 18°</ListItemText>
        </ListItem>
        <Divider />
        <ListItem>
          <ListItemText>Sunday</ListItemText>
          <ListItemIcon>
            <CloudIcon />
          </ListItemIcon>
          <ListItemText>L: 3°</ListItemText>
          <ListItemText>H: 16°</ListItemText>
        </ListItem>
        <Divider />

        <ListItem>
          <ListItemText>Monday</ListItemText>
          <ListItemIcon>
            <UmbrellaIcon />
          </ListItemIcon>
          <ListItemText>L: 2°</ListItemText>
          <ListItemText>H: 15°</ListItemText>
        </ListItem>
      </List>
    </>
  );
};

export default Home;