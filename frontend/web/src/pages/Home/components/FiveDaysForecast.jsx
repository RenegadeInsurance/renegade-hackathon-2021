import {
  Container,
  List,
  ListItem,
  ListItemText,
  Divider,
  Skeleton,
  Avatar,
  Typography,
} from '@mui/material';
import { useQuery } from 'react-query';

import { fiveDaysForecast } from './../api';

const FiveDaysForecast = ({ loc }) => {
  const weekday = ['Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat'];
  const { data, isLoading, error, refetch } = useQuery(
    ['fiveDaysForecast', { locName: loc }],
    fiveDaysForecast
  );

  return (
    <>
      <Container>
        <Typography
          textAlign='center'
          variant='h4'
          paddingTop={2}
          paddingBottom={2}
        >
          Weather Forecast
        </Typography>
        <List>
          {isLoading ? (
            <Skeleton />
          ) : (
            data.forecast.forecastday.map((singleDay) => (
              <div key={singleDay.date}>
                <ListItem>
                  <ListItemText>
                    {weekday[new Date(singleDay.date).getDay()]}
                  </ListItemText>
                  <ListItemText>
                    <Avatar
                      alt='Weather type icon'
                      src={singleDay.day.condition.icon}
                      sx={{ width: 56, height: 56 }}
                    />
                  </ListItemText>
                  <ListItemText>L: {singleDay.day.maxtemp_c}°</ListItemText>
                  <ListItemText>H: {singleDay.day.mintemp_c}°</ListItemText>
                </ListItem>
                <Divider />
              </div>
            ))
          )}
        </List>
      </Container>
    </>
  );
};

export default FiveDaysForecast;
