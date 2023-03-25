import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/articles_model.dart';

class ArticleController {
  final CollectionReference _articlesCollection =
      FirebaseFirestore.instance.collection('articles');

  Future<void> addArticle(Articles article) async {
    final jsonArticle = json.decode(article.toJson());
    await _articlesCollection.add(jsonArticle);
  }

  final fireStore = FirebaseFirestore.instance;

  Future<List<Articles>> searchArticles(String searchText) async {
    var articles = <Articles>[];
    try {
      final querySnapshot = await fireStore
          .collection('articles')
          .where('title', isGreaterThanOrEqualTo: searchText)
          .where('title', isLessThan: '${searchText}z')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var document in querySnapshot.docs) {
          final article = Articles.fromMap(document.data());
          articles.add(article);
        }
      }
    } catch (e) {
      print('Error while searching articles: $e');
    }
    return articles;
  }

  Future<List<Articles>> getArticles() async {
    var articles = <Articles>[];
    try {
      final querySnapshot = await _articlesCollection.get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var document in querySnapshot.docs) {
          final article = Articles.fromMap(
              document.data() as Map<String, dynamic>); // check it carefully.
          articles.add(article);
        }
      }
    } catch (e) {
      print('Error while getting articles: $e');
    }
    return articles;
  }
}

class FirebaseArticleController {
  final fireStore = FirebaseFirestore.instance;

  Future<List<Articles>> searchArticles(String searchText) async {
    var articles = <Articles>[];
    try {
      final querySnapshot = await fireStore
          .collection('articles')
          .where('title', isGreaterThanOrEqualTo: searchText)
          .where('title', isLessThan: '${searchText}z')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var document in querySnapshot.docs) {
          final article = Articles.fromMap(document.data());
          articles.add(article);
        }
      }
    } catch (e) {
      print('Error while searching articles: $e');
    }
    return articles;
  }
}
