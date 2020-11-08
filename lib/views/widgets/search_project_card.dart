import 'package:FL1_Norbert/models/project.dart';
import 'package:FL1_Norbert/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchProjectCard extends StatelessWidget {
  const SearchProjectCard(this._project, this._onTap);

  final Project _project;
  final Function(Project) _onTap;

  @override
  Widget build(BuildContext context) {
    final MaterialColor color = getColor(_project.color) as MaterialColor;
    return InkWell(
      onTap: () => _onTap(_project),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color[100],
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColor(_project.color),
            ),
          ),
        ),
        title: Text(_project.name),
      ),
    );
  }
}
