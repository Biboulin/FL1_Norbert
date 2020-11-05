import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/views/view_selection.dart';
import 'package:FL1_Norbert/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Future.wait([
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/draw_1.svg'),
        null),
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/draw_2.svg'),
        null),
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/draw_3.svg'),
        null),
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/wave_1.svg'),
        null),
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/wave_2.svg'),
        null),
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/images/wave_3.svg'),
        null)
  ]);

  initializeDateFormatting().then(
    (_) => runApp(
      MultiProvider(
        providers: <ChangeNotifierProvider<Data>>[
          ChangeNotifierProvider<Data>(create: (_) => Data()),
        ],
        child: MyApp(),
      ),
    ),
  );
}
//runApp(MyApp());

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        <SystemUiOverlay>[SystemUiOverlay.top]);
    return FutureBuilder<FirebaseApp>(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: ViewSelection(),
            debugShowCheckedModeBanner: false,
          );
        }
        return MaterialApp(
          home: Loader(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
