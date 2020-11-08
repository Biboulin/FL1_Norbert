import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotesRow extends StatelessWidget {
  const NotesRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 94,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              const Text('totooo'),
            ],
          ),
        ),
      ),
    );
  }
}
