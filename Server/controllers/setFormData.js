const { Person } = require("../db/Person");

const setFormData = (req, res) => {
  const { name, age, gender, email, country, state, city, alertGroups } =
    req.body;
  new Person(req.body).save((err) => {
    if (err) throw err;
    res.end();
  });
};

module.exports = setFormData;
