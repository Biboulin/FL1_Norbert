import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/utils/colors.dart';

class NotesRow extends StatelessWidget {
  const NotesRow({this.noteColor, this.description, this.type});
  //const NotesRow({Key key}) : super(key: key);
  final String noteColor;
  final String description;
  final String type;

  Color pickColor(String color) {
    switch (color) {
      case 'purple':
        return purple;
      case 'brown':
        return brown;
      case 'paleRed':
        return paleRed;
      case 'paleBlack':
        return paleBlack;
      case 'green':
        return green;
      default:
        return blueAppBar;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 94,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 25.0),
              color: pickColor(noteColor),
              height: 3,
              width: 121,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: 15.0,
                // top: 15.0,
              ),
              child: Row(
                children: <Widget>[
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
