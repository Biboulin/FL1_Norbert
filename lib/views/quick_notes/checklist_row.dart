import 'package:FL1_Norbert/models/quick_notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/utils/colors.dart';

class CheckListRow extends StatelessWidget {
  const CheckListRow(
      {this.noteColor, this.description, this.type, this.title, this.items});
  //const NotesRow({Key key}) : super(key: key);
  final String noteColor;
  final String title;
  final String description;
  final String type;
  final List<Item> items;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        description,
                        style: const TextStyle(fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                  // ListView.builder(
                  //   itemCount: items.length,
                  //   itemBuilder: (BuildContext context, int index) {},
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
