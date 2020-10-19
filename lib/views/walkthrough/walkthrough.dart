import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/views/walkthrough/svg_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Walkthrough extends StatefulWidget {
  const Walkthrough(
    this.nbPage,
    this.mainText,
    this.secondaryText, {
    Key key,
  }) : super(key: key);

  final int nbPage;
  final String mainText;
  final String secondaryText;
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  @override
  Widget build(BuildContext context) {
    final int _idx = widget.nbPage;
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 120),
              child: SvgBuilder('walkthrough_$_idx'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
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
              margin: const EdgeInsets.only(top: 5),
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
    );
  }
}
