import 'package:FL1_Norbert/models/quick_notes.dart';
import 'package:FL1_Norbert/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/views/quick_notes/notes_row.dart';
import 'package:FL1_Norbert/models/data.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuickNoteList extends StatefulWidget {
  @override
  _QuickNoteListState createState() => _QuickNoteListState();
}

class _QuickNoteListState extends State<QuickNoteList> {
  // List<> notes =

  int noteNb;
  List<QuickNotes> notes = <QuickNotes>[];
  final CollectionReference quickNotes =
      FirebaseFirestore.instance.collection('quickNotes');

  void fillNotes(List<String> notesId) async {
    //User currentUser = context.read<Data>().currentUser;

    for (int i = 0; i < notesId.length; i++) {
      // quickNotes.doc(user.quickNoteIds[i]).get().then((DocumentSnapshot snapshot) {
      //   var test = snapshot;
      //   print(test);
      // });
      var res = await quickNotes.doc(notesId[i]).get();
      dynamic dbNote = res.data();
      print(dbNote);
      QuickNotes newNote = QuickNotes(
        description: dbNote['description'] as String,
        color: dbNote['color'] as String,
        type: dbNote['type'] as String,
      );

      notes.add(newNote);
    }
  }

  @override
  void initState() {
    // List<String> allNotes = context.watch<Data>().currentUser.quickNoteIds;
    // fillNotes(allNotes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //fillNotes(allNotes);
    List<String> allNotes = context.watch<Data>().currentUser.quickNoteIds;

    fillNotes(allNotes);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: allNotes.length,
        //itemCount: 5,
        itemBuilder: (BuildContext context, int index) =>
            NotesRow(description: notes[index].description),
      ),
    );
  }
}
