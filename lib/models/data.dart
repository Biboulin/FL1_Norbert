import 'package:FL1_Norbert/__mock__/projects_mock.dart';
import 'package:FL1_Norbert/models/project.dart';
import 'package:FL1_Norbert/models/quick_notes.dart';
import 'package:FL1_Norbert/models/task/task_enum.dart';
import 'package:FL1_Norbert/models/user.dart';
import 'package:flutter/material.dart';
import 'task/task.dart';

class Data with ChangeNotifier {
  Data() {
    _filterTaskState = FilterTask.all;
    //_users.addAll(usersMock);
    _projects.addAll(projectsMock);
  }

  final List<Task> _tasks = <Task>[];
  //final List<ListItem> _items = <ListItem>[];
  final List<Task> _displayTasks = <Task>[];
  User _currentUser = User(quickNoteIds: <String>[]);
  FilterTask _filterTaskState;
  final List<User> _users = <User>[];
  final List<Project> _projects = <Project>[];
  final List<QuickNotes> _notes = <QuickNotes>[];

  User get currentUser => _currentUser;
  List<Task> get tasks => _tasks;
  List<Task> get displayTasks => _displayTasks;
  List<QuickNotes> get notes => _notes;
  FilterTask get filterTastState => _filterTaskState;
  List<User> get users => _users;
  List<Project> get projects => _projects;

  void setUsr(User usr) => _currentUser = usr;
  void setNotes(QuickNotes notes) => _notes.add(notes);

  void addNotes(String noteId) {
    _currentUser.quickNoteIds.add(noteId);
    notifyListeners();
  }

  void delTasks(List<Task> tasksToDel) {
    for (final Task task in tasksToDel) {
      _tasks.removeWhere((Task element) => task.id == element.id);
      _displayTasks.removeWhere((Task element) => task.id == element.id);
    }
    notifyListeners();
  }

  void addTasks(List<Task> tasksToAdd) {
    _tasks
      ..clear()
      ..addAll(tasksToAdd);
    _displayTasks
      ..clear()
      ..addAll(tasksToAdd);
    print(tasksToAdd.length);
    notifyListeners();
  }

  void filterTasks(FilterTask filter) {
    _filterTaskState = filter;
    switch (filter) {
      case FilterTask.all:
        _displayTasks.clear();
        _displayTasks.addAll(_tasks);
        break;
      case FilterTask.closed:
        _displayTasks.clear();
        _displayTasks
            .addAll(_tasks.where((Task element) => element.isDone == true));
        break;
      case FilterTask.open:
        _displayTasks.clear();
        _displayTasks
            .addAll(_tasks.where((Task element) => element.isDone == false));
        break;
      default:
    }
    notifyListeners();
  }

  void setUsers(List<User> user) {
    _users.addAll(user);
  }

  void setTasks(List<Task> task) {
    _tasks.addAll(task);
    _displayTasks.addAll(task);
  }

  void notify() => notifyListeners();
}
