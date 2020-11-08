import 'dart:io';
import 'package:FL1_Norbert/models/task/task.dart';
import 'package:FL1_Norbert/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

CollectionReference collectionReferenceTasks() =>
    FirebaseFirestore.instance.collection('tasks');

Future<QuerySnapshot> getAllTasksByAssignee(
        CollectionReference tasks, User user) =>
    tasks.where('_user', isEqualTo: user.id).get();

Future<QuerySnapshot> getAllTasksByMember(
        CollectionReference tasks, User user) =>
    tasks.where('_forUser', arrayContains: user.id).get();

Future<void> createTask(Task task) async {
  final Map<String, dynamic> taskJson = task.toJson();
  print(taskJson);
  collectionReferenceTasks()
      .add(taskJson)
      .then((DocumentReference value) => print('done'));
}

Future<void> deleteTask(Task task) async {
  collectionReferenceTasks().doc(task.id).delete();
}

Future<void> editTaskStatus(Task task) async {
  collectionReferenceTasks().doc(task.id).set(task.toJson());
}

Future<String> uploadImageToFirebase(
    BuildContext context, File _imageFile) async {
  final dynamic fileName = basename(_imageFile.path);
  final storage.Reference firebaseStorageRef =
      storage.FirebaseStorage.instance.ref().child('uploads/$fileName');
  final storage.UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
  final storage.TaskSnapshot taskSnapshot = await uploadTask;
  return taskSnapshot.ref.getDownloadURL();
}
