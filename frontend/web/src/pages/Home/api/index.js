import axios from 'axios';

export const getWeather = async ({ queryKey }) => {
  const [, { locName }] = queryKey;
  const { data } = await axios.get(
    `http://localhost:8000/api/weather/weather-forecast/?location=${locName}`
  );
  return data;
};
