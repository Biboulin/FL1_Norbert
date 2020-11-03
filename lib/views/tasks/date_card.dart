import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class DateCard extends StatelessWidget {
  const DateCard(this._date);

  final DateTime _date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        DateFormat.yMMMMd('fr_FR').format(_date).toString(),
        style: const TextStyle(
          color: greyDateCards,
        ),
      ),
    );
  }
}
