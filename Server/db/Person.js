const mongoose = require("mongoose");
const { Schema } = mongoose;

const personSchema = new Schema({
  user_id: "String",
  city: "String",
  country: "String",
  state: "String",
  name: "String",
  email: "String",
  age: "String",
  gender: "String",
  alertGroups: [
    {
      name: "String",
      relationShip: "String",
      email: "String",
      phone: "String",
    },
  ],
});

const Person = mongoose.model("person", personSchema);

module.exports = Person;
