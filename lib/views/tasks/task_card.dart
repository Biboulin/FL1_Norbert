
import 'package:FL1_Norbert/models/task/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:FL1_Norbert/utils/functions.dart';

class TaskCard extends StatelessWidget {

  const TaskCard(this._task);

  final Task _task;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Slidable(
        actionPane: const SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: ListTile(
          leading: Container(
            height: double.infinity,
            child: IconButton(
              icon: const Icon(Icons.radio_button_unchecked),
              onPressed: () => null,
            ),
          ),
          title: Text(_task.title),
          subtitle: Text(DateFormat.yMMMMd().format(_task.dueDate).toString()),
          trailing: Container(
            width: 4,
            height: 30,
            color: getColor(_task.color),
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            color: Colors.grey[350],
            icon: Icons.edit,
            onTap: () => print('Modifier'),
          ),
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => print('Supprimer'),
          ),
        ],
      ),
    );
  }
}
