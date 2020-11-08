import 'package:FL1_Norbert/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserToolTip extends StatelessWidget {
  const UserToolTip(this._user);

  final User _user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
        Text(
          _user.firstName,
        ),
      ],
    );
  }
}
