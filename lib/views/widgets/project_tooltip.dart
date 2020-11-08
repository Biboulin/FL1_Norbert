import 'package:FL1_Norbert/models/project.dart';
import 'package:FL1_Norbert/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectToolTip extends StatelessWidget {
  const ProjectToolTip(this._project);

  final Project _project;

  @override
  Widget build(BuildContext context) {
    final MaterialColor color = getColor(_project.color) as MaterialColor;
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundColor: color[100],
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: getColor(_project.color),
              ),
            ),
          ),
        ),
        Text(
          _project.name,
        ),
      ],
    );
  }
}
