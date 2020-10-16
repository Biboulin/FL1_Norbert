import 'package:FL1_Norbert/views/home.dart';
import 'package:FL1_Norbert/views/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      //home: Home(),
    );
  }
}
