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
  SvgPicture svg;
  List<SvgPicture> drawsAssets = <SvgPicture>[];
  List<SvgPicture> wavesAssets = <SvgPicture>[];

  Future<SvgPicture> loadSvg(BuildContext context, String path) async {
    final SvgPicture picture = SvgPicture.asset(path);
    await precachePicture(picture.pictureProvider, context);
    // drawsAssets.add(picture);
    return picture;
  }

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
      case 'wave_1':
        _assetPath = 'assets/images/wave_1.svg';
        svg = SvgPicture.asset(
          _assetPath,
          semanticsLabel: 'Wave 1',
          width: 393,
        );
        return svg;
      case 'wave_2':
        _assetPath = 'assets/images/wave_2.svg';
        svg = SvgPicture.asset(
          _assetPath,
          semanticsLabel: 'Wave 2',
          width: 393,
        );
        return svg;
      case 'wave_3':
        _assetPath = 'assets/images/wave_3.svg';
        svg = SvgPicture.asset(
          _assetPath,
          semanticsLabel: 'Wave 3',
          width: 393,
        );
        return svg;
      default:
        _assetPath = 'assets/images/draw_1.svg';
        svg = SvgPicture.asset(_assetPath, semanticsLabel: 'Walkthrough 1');
        return svg;
    }
  }
}
