import 'dart:convert';
import 'package:FL1_Norbert/__mock__/tasks_mock.dart';
import 'package:FL1_Norbert/models/user.dart';
import 'dart:io' as Io;

//final bytes = Io.File('/assets/images/logo.png').readAsBytesSync();
//String img64 = base64Encode(bytes);

User userMock = User(
    firstName: "prenom",
    lastName: "nom",
    email: "email",
    image: 'assets/images/chat_cactus.jpg');
