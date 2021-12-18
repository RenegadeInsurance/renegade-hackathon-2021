class NewsModel {
  final String title;
  final String newsContent;
  final String imageURL;
  final String creationDate;

  NewsModel({
    required this.title,
    required this.newsContent,
    required this.imageURL,
    required this.creationDate,
  });

  factory NewsModel.fromJson(final json) {
    return NewsModel(
      title: json["title"],
      newsContent: json["newsContent"],
      imageURL: json["imageURL"],
      creationDate: json["creationDate"],
    );
  }
}
