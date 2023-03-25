import 'dart:convert';

class Articles {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String content;
  Articles({
    required this.title,
    required this.author,
    required this.description,
    required this.urlToImage,
    required this.content,
  });

  Articles copyWith({
    String? title,
    String? author,
    String? description,
    String? urlToImage,
    String? content,
  }) {
    return Articles(
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      urlToImage: urlToImage ?? this.urlToImage,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'description': description,
      'urlToImage': urlToImage,
      'content': content,
    };
  }

  factory Articles.fromMap(Map<String, dynamic> map) {
    return Articles(
      title: map['title'] as String,
      author: map['author'] as String,
      description: map['description'] as String,
      urlToImage: map['urlToImage'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Articles.fromJson(String source) =>
      Articles.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Articles(title: $title, author: $author, description: $description, urlToImage: $urlToImage, content: $content)';
  }

  @override
  bool operator ==(covariant Articles other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.author == author &&
        other.description == description &&
        other.urlToImage == urlToImage &&
        other.content == content;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        author.hashCode ^
        description.hashCode ^
        urlToImage.hashCode ^
        content.hashCode;
  }
}
