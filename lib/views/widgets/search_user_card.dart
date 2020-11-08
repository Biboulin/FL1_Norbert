import 'package:FL1_Norbert/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchUserCard extends StatelessWidget {
  const SearchUserCard(this._user, this._onTap);

  final User _user;
  final Function(User) _onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(_user),
      child: ListTile(
        leading: CircleAvatar(
          //backgroundImage: _user.image.isEmpty ? null,
          child: const Icon(Icons.person),
          backgroundColor: Colors.grey[200],
        ),
        title: _user.lastName != null
            ? Text(_user.firstName + ' ' + _user.lastName)
            : Text(_user.firstName),
        subtitle: Text(_user.email),
      ),
    );
  }
}
