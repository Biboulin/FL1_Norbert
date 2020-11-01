import 'package:FL1_Norbert/__mock__/tasks_mock.dart';
import 'package:flutter/material.dart';
import 'task/task.dart';

class Data with ChangeNotifier {

  Data() {
    _tasks.addAll(tasksMock);
  }

  final List<Task> _tasks = <Task>[];

  List<Task> get tasks => _tasks;

}