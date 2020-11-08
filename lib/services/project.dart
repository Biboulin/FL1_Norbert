import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<List<Project>> getAllProjects(BuildContext context) async {
  final List<Project> allProjects = [];

  final CollectionReference projects =
      FirebaseFirestore.instance.collection('projects');
  projects.get().then((QuerySnapshot querySnapshot) {
    for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
      final Project tmp = Project.fromJson(doc.data());
      tmp.id = doc.id;
      allProjects.add(tmp);
    }
  });
  //context.watch<Data>().addProjects(allProjects);
  return allProjects;
}

Future<List<Project>> getUserProjects(BuildContext context) async {
  final List<Project> userProjects = [];

  if (context.read<Data>().currentUser.projectIds != null) {
    for (final String userProjectId
        in context.read<Data>().currentUser.projectIds) {
      for (final Project project in context.read<Data>().projects) {
        if (userProjectId == project.id) {
          userProjects.add(project);
        }
      }
    }
  }
  return userProjects;
}
