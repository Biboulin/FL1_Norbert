import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/views/walkthrough/walkthrough_old.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:FL1_Norbert/views/walkthrough/walkthrough.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/views/walkthrough/svg_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatefulWidget {
  const Welcome(
    this.handleRedirectRegister,
    this.handleRedirectLogin, {
    Key key,
  }) : super(key: key);

  final Function handleRedirectRegister;
  final Function handleRedirectLogin;

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int currentIndexPage;
  int pageLength;
  List<Widget> mainAssets = <Widget>[];
  List<Widget> waveAssets = <Widget>[];
  List<Widget> pages = <Widget>[];

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 3;

    mainAssets.add(const SvgBuilder('walkthrough_1'));
    mainAssets.add(const SvgBuilder('walkthrough_2'));
    mainAssets.add(const SvgBuilder('walkthrough_3'));
    for (int i = 1; i <= 3; i++) {
      waveAssets.add(SvgBuilder('wave_$i'));
    }

    pages = <Widget>[
      Walkthrough(
        1,
        'Bienvenue sur Tout doux liste !',
        "Qu'avez vous de prévu demain ?",
        mainAssets[0],
        waveAssets[0],
        widget.handleRedirectRegister,
        widget.handleRedirectLogin,
      ),
      Walkthrough(
        2,
        'Suivez vos tâches',
        'Vous êtes notifié lorsque des tâches sont terminées.',
        mainAssets[1],
        waveAssets[1],
        widget.handleRedirectRegister,
        widget.handleRedirectLogin,
      ),
      Walkthrough(
        3,
        'Créer et assigner',
        'Créer des tâches et assignez les à vos collègues.',
        mainAssets[2],
        waveAssets[2],
        widget.handleRedirectRegister,
        widget.handleRedirectLogin,
      ),
    ];
    // mainAssets[0] = const SvgBuilder('walkthrough_1');
    // mainAssets[1] = const SvgBuilder('walkthrough_2');
    // mainAssets[2] = const SvgBuilder('walkthrough_3');

    // waveAssets[0] = const SvgBuilder('wave_1');
    // waveAssets[1] = const SvgBuilder('wave_2');
    // waveAssets[2] = const SvgBuilder('wave_3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            children: <Widget>[
              pages[0],
              pages[1],
              pages[2],
            ],
            onPageChanged: (int value) {
              setState(() {
                currentIndexPage = value;
              });
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.64,
            // left: MediaQuery.of(context).size.width * 0.35,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 165,
              ),
              //left: MediaQuery.of(context).size.width * 0.43),
              child: Align(
                alignment: Alignment.centerRight,
                child: DotsIndicator(
                  dotsCount: pageLength,
                  position: currentIndexPage,
                  decorator: const DotsDecorator(
                    activeColor: darkBlue,
                    color: greySubtitles,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
