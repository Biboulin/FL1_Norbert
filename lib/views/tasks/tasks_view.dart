import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/task/task.dart';
import 'package:FL1_Norbert/models/task/task_helpers.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TasksView extends StatefulWidget {
  @override
  _TasksViewState createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {

  final List<Task> _tasks = <Task>[];
  final List<Task> _orderedTasks = <Task>[];
  final List<Widget> _displayList = <Widget>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _tasks.addAll(context.watch<Data>().tasks);
    _orderedTasks.addAll(orderTasksByDate(_tasks));
    _displayList.addAll(createDisplayTasksList(_orderedTasks));

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
        itemCount: _displayList.length,
        itemBuilder: (BuildContext context, int index) => _displayList[index],
      ),
    );
  }
}