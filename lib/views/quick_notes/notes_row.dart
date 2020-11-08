import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/utils/colors.dart';

class NotesRow extends StatelessWidget {
  const NotesRow({this.noteColor, this.description});
  //const NotesRow({Key key}) : super(key: key);
  final Color noteColor;
  final String description;
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
              color: noteColor,
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
