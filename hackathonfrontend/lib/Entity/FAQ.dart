class FAQ {
  final int FAQID;
  final int riskAssessmentID;
  final double yesRiskFactor;
  final double noRiskFactor;
  final String question;
  final int yesNode;
  final int noNode;
  final bool isStart;

  FAQ(this.FAQID, this.riskAssessmentID, this.yesRiskFactor, this.noRiskFactor,
      this.question, this.yesNode, this.noNode, this.isStart);

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
      json["faqID"],
      json["riskAssessmentID"],
      json["yesRiskFactor"],
      json["noRiskFactor"],
      json["question"],
      json["yesNode"],
      json["noNode"],
      json["isStart"] == 0 ? false : true,
    );
  }
}
