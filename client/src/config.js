const config = {
  // baseURI: '/api', // http://localhost:8000/api since we config proxy = 8000
  baseURI: process.env.REACT_APP_URL, // http://localhost:8000/api since we config proxy = 8000
  weatherBaseURI: process.env.REACT_APP_WEATHER_URL,
  API_KEY: process.env.REACT_APP_API_KEY,
  endpoints: {
    auth: {
      login: "/login",
      createAccount: "/register",
      logout: "/logout",
      me: "/users/me",
      profile: "/users",
    },
    form: {
      id: "/forms",
      v2: "/dynamic-forms"
    },
    weather: {
      current: "/current.json"
    }
  },
};
export default config;
