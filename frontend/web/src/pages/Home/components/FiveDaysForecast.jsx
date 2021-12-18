import {
  Container,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Divider,
} from '@mui/material';
import WbSunnyIcon from '@mui/icons-material/WbSunny';
import CloudIcon from '@mui/icons-material/Cloud';
import UmbrellaIcon from '@mui/icons-material/Umbrella';

const FiveDaysForecast = () => {
  return (
    <>
      <Container>
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
      </Container>
    </>
  );
};

export default FiveDaysForecast;
