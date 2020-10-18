import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:FL1_Norbert/views/walkthrough.dart';
import 'package:FL1_Norbert/views/utils/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({
    Key key,
  }) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int currentIndexPage;
  int pageLength;

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            children: const <Widget>[
              Walkthrough(
                1,
                'Bienvenue sur Tout doux liste !',
                "Qu'avez vous de prévu demain ?",
              ),
              Walkthrough(
                2,
                'Suivez vos tâches',
                'Vous êtes notifié lorsque des tâches sont terminées.',
              ),
              Walkthrough(
                3,
                'Créer et assigner',
                'Créer des tâches et assignez les à vos collègues.',
              ),
            ],
            onPageChanged: (int value) {
              setState(() {
                currentIndexPage = value;
              });
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
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
          )
        ],
      ),
    );
  }
}
