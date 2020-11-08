import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/project.dart';
import 'package:FL1_Norbert/models/task/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<List<Project>> getAllProjects(BuildContext context) async {
  final List<Project> allProjects = <Project>[];

  final CollectionReference projects =
      FirebaseFirestore.instance.collection('projects');
  final QuerySnapshot querySnapshot = await projects.get();
  for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
    final Project tmp = Project.fromJson(doc.data());
    tmp.id = doc.id;
    allProjects.add(tmp);
  }
  return allProjects;
}

List<Project> getUserProjects(BuildContext context) {
  final List<Project> userProjects = <Project>[];

  if (context.watch<Data>().currentUser.projectIds != null) {
    for (final String userProjectId
        in context.watch<Data>().currentUser.projectIds) {
      for (final Project project in context.watch<Data>().projects) {
        if (userProjectId == project.id) {
          userProjects.add(project);
        }
      }
    }
  }
  //context.read<Data>().addUserProjects(userProjects);
  return userProjects;
}

int countCompletedTasks(BuildContext context) {
  int i = 0;

  for (final Task task in context.watch<Data>().displayTasks) {
    if (task.isDone == true) {
      i += 1;
    }
  }

  return i;
}

int countTasksInProject(BuildContext context, String projectId) {
  int i = 0;

  for (final Task task in context.watch<Data>().displayTasks) {
    if (task.attachedProjectId == projectId) {
      i += 1;
    }
  }
  return i;
}

int countPercentageDoneTasks(
    BuildContext context, int totalTasks, String projectId) {
  int i = 0;
  if (totalTasks > 0) {
    for (final Task task in context.watch<Data>().displayTasks) {
      if (task.attachedProjectId == projectId && task.isDone == true) {
        i += 1;
      }
    }
    return ((i / totalTasks) * 100).round();
  }
  return 0;
}
