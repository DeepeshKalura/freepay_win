import 'dart:convert';

class ProjectModel {
  final String title;
  final String name;
  final String imagePath;
  final String amount;
  ProjectModel({
    required this.title,
    required this.name,
    required this.imagePath,
    required this.amount,
  });

  ProjectModel copyWith({
    String? title,
    String? name,
    String? imagePath,
    String? amount,
  }) {
    return ProjectModel(
      title: title ?? this.title,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'name': name,
      'imagePath': imagePath,
      'amount': amount,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      title: map['title'] as String,
      name: map['name'] as String,
      imagePath: map['imagePath'] as String,
      amount: map['amount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProjectModel(title: $title, name: $name, imagePath: $imagePath, amount: $amount)';
  }

  @override
  bool operator ==(covariant ProjectModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.name == name &&
        other.imagePath == imagePath &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        name.hashCode ^
        imagePath.hashCode ^
        amount.hashCode;
  }
}
