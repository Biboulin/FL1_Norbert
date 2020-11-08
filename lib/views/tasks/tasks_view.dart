import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/task/task_helpers.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class TasksView extends StatefulWidget {
  @override
  _TasksViewState createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final List<Widget> _displayList = <Widget>[];
  CalendarController _calendarController;
  final Map<DateTime, List<String>> _events = <DateTime, List<String>>{};

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
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
      ..addAll(createDisplayTasksList(context.watch<Data>().displayTasks));
    _events
      ..clear()
      ..addAll(toMapForCalendarEvents(context.watch<Data>().displayTasks));

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
