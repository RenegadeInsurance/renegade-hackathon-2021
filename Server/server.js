const express = require("express");
const cron = require("node-cron");

const app = express();
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server started at port ${PORT}`);
});

/*
cron.schedule("* * * * *", () => {
  console.log("---running task every 15 minutes---");
  async function asyncFunc() {
    const city = "kathmandu";
    const key = "bc59d3d5536ebff9aead52833ca04899";
    try {
      const response = await axios.get(
        `http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${key}`
      );
      const data = await response.json();
      console.log(data);
    } catch (error) {
      console.log(error); // catches both errors
    }
  }
});
*/

require("./api/routes")(app);
