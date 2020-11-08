import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference collectionReferenceUsers() =>
    FirebaseFirestore.instance.collection('users');

Future<QuerySnapshot> getAllUsers(CollectionReference users) => users.get();
