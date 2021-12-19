const mongoose = require("mongoose");
const { Schema } = mongoose;

const riskAssessmentSchema = new Schema({});

const RiskAssessment = mongoose.model("riskAssessment", personSchema);

module.exports = RiskAssessment;
