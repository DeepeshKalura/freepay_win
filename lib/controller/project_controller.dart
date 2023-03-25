import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/project_model.dart';

class ProjectController {
  final CollectionReference _projectCollection =
      FirebaseFirestore.instance.collection('project');

  Future<void> addProject(ProjectModel project) async {
    final jsonArticle = json.decode(project.toJson());
    await _projectCollection.add(jsonArticle);
  }

  final fireStore = FirebaseFirestore.instance;

  Future<List<ProjectModel>> searchProject(String searchText) async {
    var articles = <ProjectModel>[];
    try {
      final querySnapshot = await fireStore
          .collection('project')
          .where('title', isGreaterThanOrEqualTo: searchText)
          .where('title', isLessThan: '${searchText}z')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var document in querySnapshot.docs) {
          final article = ProjectModel.fromMap(document.data());
          articles.add(article);
        }
      }
    } catch (e) {
      print('Error while searching articles: $e');
    }
    return articles;
  }

  Future<List<ProjectModel>> getProject() async {
    var articles = <ProjectModel>[];
    try {
      final querySnapshot = await _projectCollection.get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var document in querySnapshot.docs) {
          final article = ProjectModel.fromMap(
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
