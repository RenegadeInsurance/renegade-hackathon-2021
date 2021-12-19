const { setLocation } = require("../controllers/setLocation");
const { setFormData } = require("../controllers/setFormData");

const router = function (app) {
  app.post("/set_location", setLocation);
  app.post("/assessment_form_send", setFormData);
};

module.exports = router;
