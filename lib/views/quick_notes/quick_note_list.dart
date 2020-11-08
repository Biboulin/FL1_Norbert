import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/views/quick_notes/notes_row.dart';

class QuickNoteList extends StatefulWidget {
  @override
  _QuickNoteListState createState() => _QuickNoteListState();
}

class _QuickNoteListState extends State<QuickNoteList> {
  // List<> notes =
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) => const NotesRow(),
        ),
      ),
    );
  }
}
