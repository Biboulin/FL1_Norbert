import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/views/auth/login.dart';
import 'package:FL1_Norbert/views/auth/register.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough(
    this.nbPage,
    this.mainText,
    this.secondaryText,
    this.mainAsset,
    this.waveAsset,
    this.handleRedirectRegister,
    this.handleRedirectLogin, {
    Key key,
  }) : super(key: key);

  final int nbPage;
  final String mainText;
  final String secondaryText;
  final Widget mainAsset;
  final Widget waveAsset;
  final Function handleRedirectRegister;
  final Function handleRedirectLogin;

  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 120),
                  child: widget.mainAsset,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    widget.mainText,
                    style: const TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 28,
                      color: blackMaintitles,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Text(
                    widget.secondaryText,
                    style: const TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 22,
                      color: greySubtitles,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: widget.waveAsset,
            alignment: Alignment.bottomCenter,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(
              bottom: 110,
            ),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: white,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75),
                  ),
                ],
              ),
              child: ButtonTheme(
                minWidth: 293,
                height: 48,
                child: RaisedButton(
                  elevation: 3,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(
                        builder: (BuildContext context) => const Register(),
                      ),
                    );
                  },
                  color: white,
                  child: const Text(
                    'Commencer',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: borderGrey),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(
              bottom: 55,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(
                    builder: (BuildContext context) => const Login(),
                  ),
                );
              },
              child: const Text(
                'Se connecter',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  color: white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
