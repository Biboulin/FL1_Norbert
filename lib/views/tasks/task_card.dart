import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/task/task.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:FL1_Norbert/utils/functions.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(this._task);

  final Task _task;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Slidable(
        actionPane: const SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: ListTile(
          leading: Container(
            height: double.infinity,
            child: IconButton(
              icon: _task.isDone
                  ? Icon(
                      Icons.radio_button_checked,
                      color: getColor(_task.color),
                    )
                  : Icon(
                      Icons.radio_button_unchecked,
                      color: getColor(_task.color),
                    ),
              onPressed: () {
                _task.isDone = !_task.isDone;
                // TODO edit task in db
                context.read<Data>().notify();
              },
            ),
          ),
          title: Text(
            _task.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _task.isDone
                ? const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: greyDateCards,
                  )
                : null,
          ),
          subtitle: Text(
            DateFormat.yMMMMd('fr_FR').format(_task.dueDate).toString(),
            style: _task.isDone
                ? const TextStyle(
                    decoration: TextDecoration.lineThrough,
                  )
                : null,
          ),
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
            onTap: () {
              // TODO edit task
              print('Modifier');
            },
          ),
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              // TODO Delete task in db
              context.read<Data>().delTasks(<Task>[_task]);
              Scaffold.of(context).showSnackBar(
                  const SnackBar(content: Text('Tâche supprimée')));
            },
          ),
        ],
      ),
    );
  }
}
