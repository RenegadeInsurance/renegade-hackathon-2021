class RiskAssessmentEntity {
  final int riskAssessmentID;
  final String title;
  final String remarks;

  RiskAssessmentEntity(this.riskAssessmentID, this.title, this.remarks);

  factory RiskAssessmentEntity.fromJson(Map<String, dynamic> json) {
    return RiskAssessmentEntity(
      json["riskAssessmentID"],
      json["title"],
      json["remarks"],
    );
  }
}
