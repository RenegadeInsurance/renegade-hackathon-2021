class FAQ {
  final int FAQID;
  final String question;
  final int yesNode;
  final int noNode;
  final bool isStart;

  FAQ(this.FAQID, this.question, this.yesNode, this.noNode, this.isStart);

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
      json["faqID"],
      json["question"],
      json["yesNode"],
      json["noNode"],
      json["isStart"] == 0 ? false: true,
    );
  }
}
