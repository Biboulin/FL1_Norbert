import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/task/task.dart';
import 'package:FL1_Norbert/models/task/task_helpers.dart';
import 'package:FL1_Norbert/models/user.dart';
import 'package:FL1_Norbert/services/task.dart';
import 'package:FL1_Norbert/services/users.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TasksView extends StatefulWidget {
  @override
  _TasksViewState createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final List<Widget> _displayList = <Widget>[];
  CalendarController _calendarController;
  final Map<DateTime, List<String>> _events = <DateTime, List<String>>{};

  Future<QuerySnapshot> _getAllUsers;
  Future<QuerySnapshot> _getAllTasksByAssignee;
  Future<QuerySnapshot> _getAllTasksByMember;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    final CollectionReference users = collectionReferenceUsers();
    final CollectionReference tasksAssignee = collectionReferenceTasks();
    final CollectionReference taskMember = collectionReferenceTasks();
    _getAllUsers = getAllUsers(users);
    _getAllTasksByAssignee =
        getAllTasksByAssignee(tasksAssignee, context.read<Data>().currentUser);
    _getAllTasksByMember =
        getAllTasksByMember(taskMember, context.read<Data>().currentUser);
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _displayList
      ..clear()
      ..addAll(createDisplayTasksList(
          orderTasksByDate(context.watch<Data>().displayTasks)));
    _events
      ..clear()
      ..addAll(toMapForCalendarEvents(context.watch<Data>().displayTasks));
    return context.watch<Data>().users.isEmpty ||
            context.watch<Data>().displayTasks.isEmpty
        ? FutureBuilder<List<QuerySnapshot>>(
            future: Future.wait(<Future<QuerySnapshot>>[
              _getAllUsers,
              _getAllTasksByAssignee,
              _getAllTasksByMember
            ]),
            builder: (BuildContext context,
                AsyncSnapshot<List<QuerySnapshot>> snapshot) {
              if (snapshot.hasData &&
                  (context.watch<Data>().users.isEmpty ||
                      context.watch<Data>().displayTasks.isEmpty)) {
                for (final QueryDocumentSnapshot element
                    in snapshot.data[0].docs) {
                  final User user = User.fromJson(element.data());
                  user.id = element.id;
                  context.watch<Data>().setUsers(<User>[user]);
                }
                for (final QueryDocumentSnapshot element
                    in snapshot.data[1].docs) {
                  final Task task = Task.fromJson(element.data());
                  task.id = element.id;
                  context.watch<Data>().setTasks(<Task>[task]);
                }
                for (final QueryDocumentSnapshot element
                    in snapshot.data[2].docs) {
                  final Task task = Task.fromJson(element.data());
                  task.id = element.id;
                  context.watch<Data>().setTasks(<Task>[task]);
                }
                _displayList
                  ..clear()
                  ..addAll(createDisplayTasksList(
                      orderTasksByDate(context.watch<Data>().displayTasks)));
                _events
                  ..clear()
                  ..addAll(toMapForCalendarEvents(
                      context.watch<Data>().displayTasks));
              }
              return _content();
            },
          )
        : _content();
  }

  Column _content() {
    return Column(
      children: <Widget>[
        Material(
          elevation: 3,
          child: Container(
            color: Colors.white,
            child: TableCalendar(
              locale: 'fr_FR',
              calendarController: _calendarController,
              events: _events,
              initialCalendarFormat: CalendarFormat.week,
              availableCalendarFormats: const <CalendarFormat, String>{
                CalendarFormat.month: 'Afficher Mois',
                CalendarFormat.week: 'Afficher Semaine',
              },
              calendarStyle: const CalendarStyle(
                markersColor: blue,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _displayList.length,
            itemBuilder: (BuildContext context, int index) =>
                _displayList[index],
          ),
        ),
      ],
    );
  }
}
