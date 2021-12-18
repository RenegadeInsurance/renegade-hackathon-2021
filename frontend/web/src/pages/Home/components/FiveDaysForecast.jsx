import {
  Container,
  List,
  ListItem,
  ListItemText,
  Divider,
  Skeleton,
  Avatar,
} from '@mui/material';
import { useQuery } from 'react-query';

import { fiveDaysForecast } from './../api';

const FiveDaysForecast = () => {
  const weekday = ['Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat'];
  const { data, isLoading, error, refetch } = useQuery(
    ['fiveDaysForecast', { locName: 'kathmandu' }],
    fiveDaysForecast
  );

  return (
    <>
      <Container>
        <List>
          {isLoading ? (
            <Skeleton />
          ) : (
            data.forecast.forecastday.map((singleDay) => (
              <>
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
              </>
            ))
          )}
        </List>
      </Container>
    </>
  );
};

export default FiveDaysForecast;
