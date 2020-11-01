import 'package:FL1_Norbert/models/task/task.dart';
import 'package:FL1_Norbert/views/tasks/date_card.dart';
import 'package:FL1_Norbert/views/tasks/task_card.dart';
import 'package:flutter/widgets.dart';

List<Task> orderTasksByDate(List<Task> tasks) {
  tasks.sort((Task a, Task b) => a.dueDate.compareTo(b.dueDate));
  return tasks;
}

List<Widget> createDisplayTasksList(List<Task> tasks) {
  final List<Widget> displayList = <Widget>[];
  int i = 0;
  for (final Task task in tasks) {
    if (displayList.isEmpty) {
      displayList.add(DateCard(task.dueDate));
      displayList.add(TaskCard(task));
    }
    else if (tasks[i - 1].dueDate.isBefore(task.dueDate)) {
      displayList.add(DateCard(task.dueDate));
      displayList.add(TaskCard(task));
    }
    else
      displayList.add(TaskCard(task));
    i += 1;
  }
  return displayList;
}