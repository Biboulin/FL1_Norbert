import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/views/walkthrough/walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome(
    this.handleRedirectHome,
    {
      Key key,
  }) : super(key: key);

  final Function handleRedirectHome;

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
          ),
          if (currentIndexPage == 2)
              Positioned(
                top: MediaQuery.of(context).size.height * 0.8,
                child: TextButton(
                  onPressed: () => widget.handleRedirectHome(),
                  child: const Text('Continuer'),
                ),
              ),
        ],
      ),
    );
  }
}
