import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectDateDialog extends StatefulWidget {
  @override
  _SelectDateDialogState createState() => _SelectDateDialogState();
}

class _SelectDateDialogState extends State<SelectDateDialog> {
  CalendarController _calendarController;

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
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TableCalendar(
            locale: 'fr_FR',
            calendarController: _calendarController,
            availableCalendarFormats: const <CalendarFormat, String>{
              CalendarFormat.month: 'Mois',
            },
            calendarStyle: const CalendarStyle(
              markersColor: blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: RaisedButton(
              child: const Text(
                'Valider',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () =>
                  Navigator.pop(context, _calendarController.selectedDay),
              color: blue,
            ),
          ),
        ],
      ),
    );
  }
}
