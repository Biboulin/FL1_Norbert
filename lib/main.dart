import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/views/view_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: <ChangeNotifierProvider<Data>>[
        ChangeNotifierProvider<Data>(create: (_) => Data()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewSelection(),
    );
  }
}
