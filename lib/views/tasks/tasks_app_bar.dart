import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/task/task_enum.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TaskAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: blue,
      title: const Text('Mes tâches'),
      actions: <Widget>[
        PopupMenuButton<FilterTask>(
          initialValue: context.watch<Data>().filterTastState,
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          icon: const Icon(Icons.tune),
          onSelected: (FilterTask filter) {
            context.read<Data>().filterTasks(filter);
          },
          itemBuilder: (_) => <PopupMenuItem<FilterTask>>[
            const PopupMenuItem<FilterTask>(
              value: FilterTask.open,
              child: Text('Tâches en cours'),
            ),
            const PopupMenuItem<FilterTask>(
              value: FilterTask.closed,
              child: Text('Tâches finies'),
            ),
            const PopupMenuItem<FilterTask>(
              value: FilterTask.all,
              child: Text('Toutes les tâches'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
