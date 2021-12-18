import {weatherHttp} from "../utils/http";
import config from "../config";


export const fetchCurrentWeather = async (location) => {
  const url = config.endpoints.weather.current;
  const apiKey = config.API_KEY;
  const response = await weatherHttp.get(`${url}?key=${apiKey}&q=${location}&aqi=yes`);
  return response.data;
};
