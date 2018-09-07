class Articles {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;

  Articles(
      {this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
        author: json['author'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String,
        publishedAt: json['publishedAt'] as DateTime
    );
  }
}