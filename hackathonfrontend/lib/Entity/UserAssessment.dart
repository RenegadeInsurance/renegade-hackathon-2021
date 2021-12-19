class UserAssessment {
  final int userAssessmentID;
  final int userID;
  final int riskAssessmentID;
  final bool isTaken;
  final double riskFactor;

  UserAssessment(this.userAssessmentID, this.userID, this.riskAssessmentID,
      this.isTaken, this.riskFactor);

  factory UserAssessment.fromJson(Map<String, dynamic> json) {
    return UserAssessment(
      json["userAssessmentID"],
      json["userID"],
      json["riskAssessmentID"],
      json["isTaken"] == 0 ? false : true,
      json["riskFactor"],
    );
  }
}
