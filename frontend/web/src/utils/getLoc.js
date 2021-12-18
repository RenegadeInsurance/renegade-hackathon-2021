import axios from 'axios';

const locGetter = (setLoc) => {
  if ('geolocation' in navigator) {
    navigator.geolocation.getCurrentPosition((position) => {
      axios
        .get(
          `/api/weather/get-location-from-coordinates/?coordinates=${position.coords.latitude},${position.coords.longitude}`
        )
        .then((res) => {
          setLoc(res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    });
  } else {
    alert('Location service disabled');
  }
};

export default locGetter;
