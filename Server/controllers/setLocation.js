const { v4: uuidv4 } = require("uuid");
const Person = require("../db/Person");

const setLocation = (req, res) => {
  const { user_id, city, country, state } = req.body;
  if (!user_id) {
    new Person({
      user_id: uuidv4(),
      city,
      country,
      state,
    }).save((person, err) => {
      if (err) throw err;
      res.json({
        user_id: person.user_id,
      });
    });
  } else {
    Person.findOneAndUpdate(
      { user_id },
      { city, country, state },
      (err, person) => {
        res.json({
          user_id: person.user_id,
        });
      }
    );
  }
};

module.exports = setLocation;
