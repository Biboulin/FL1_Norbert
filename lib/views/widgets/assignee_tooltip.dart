import 'package:FL1_Norbert/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AssigneeToolTip extends StatelessWidget {
  const AssigneeToolTip(this._user);

  final User _user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
        Expanded(
          child: Text(
            _user.firstName,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
