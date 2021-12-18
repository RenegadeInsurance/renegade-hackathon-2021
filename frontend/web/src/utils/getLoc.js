import axios from 'axios';

const locGetter = () => {
  navigator.geolocation.getCurrentPosition((position) => {
    axios
      .get(`/getLoc=${position.coords.latitude},${position.coords.longitude}`)
      .then((res) => {
        return res.data;
      })
      .catch((err) => {
        console.log(err);
      });
  });
};

export default locGetter;
