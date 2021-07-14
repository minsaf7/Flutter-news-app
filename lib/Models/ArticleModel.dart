class ArticleModel {
  late String? auther;

  late String title;
  late String? description;
  late String url;
  late String? urlToImage;
  late String publishedAt;
  late String? content;

  ArticleModel(
      {this.auther,
      this.content,
      this.description,
      required this.publishedAt,
      required this.title,
      required this.url,
      this.urlToImage});
}
