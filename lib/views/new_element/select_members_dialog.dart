import 'package:FL1_Norbert/models/user.dart';
import 'package:FL1_Norbert/views/widgets/search_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectMembersDialog extends StatefulWidget {
  const SelectMembersDialog(this._users);

  final List<User> _users;

  @override
  _SelectMembersDialogState createState() => _SelectMembersDialogState();
}

class _SelectMembersDialogState extends State<SelectMembersDialog> {
  @override
  Widget build(BuildContext context) {
    void _handleMembersOnTap(User user) {
      Navigator.pop(context, user);
    }

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          /// SEARCH BAR,
          Expanded(
            child: ListView.builder(
              itemCount: widget._users.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchUserCard(
                  widget._users[index],
                  _handleMembersOnTap,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
