import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/task/task.dart';
import 'package:FL1_Norbert/utils/functions.dart';
import 'package:FL1_Norbert/views/widgets/assignee_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DescriptionTaskDialog extends StatelessWidget {
  const DescriptionTaskDialog(this._task);

  final Task _task;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15.0, bottom: 10.0),
            child: Text(
              _task.title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0, bottom: 10.0),
            child: AssigneeToolTip(
              getUserById(context.watch<Data>().users, _task.userId),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0, bottom: 10.0),
            child: Text(
              DateFormat.yMMMMd('fr_FR').format(_task.dueDate).toString(),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0, bottom: 20.0),
            child: Text(_task.description),
          ),
          Image.network(_task.image),
        ],
      ),
    );
  }
}
