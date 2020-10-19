import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgBuilder extends StatefulWidget {
  const SvgBuilder(this._assetName);

  final String _assetName;

  @override
  _SvgBuilderState createState() => _SvgBuilderState();
}

class _SvgBuilderState extends State<SvgBuilder> {
  String _assetPath;
  Widget svg;

  @override
  Widget build(BuildContext context) {
    switch (widget._assetName) {
      case 'walkthrough_1':
        _assetPath = 'assets/images/draw_1.svg';
        svg = SvgPicture.asset(_assetPath, semanticsLabel: 'Walkthrough 1');
        return svg;
      case 'walkthrough_2':
        _assetPath = 'assets/images/draw_2.svg';
        svg = SvgPicture.asset(_assetPath, semanticsLabel: 'Walkthrough 2');
        return svg;
      case 'walkthrough_3':
        _assetPath = 'assets/images/draw_3.svg';
        svg = SvgPicture.asset(_assetPath, semanticsLabel: 'Walkthrough 3');
        return svg;
      default:
        _assetPath = 'assets/images/draw_1.svg';
        svg = SvgPicture.asset(_assetPath, semanticsLabel: 'Walkthrough 1');
        return svg;
    }
  }
}
