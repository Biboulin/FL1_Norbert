import 'package:FL1_Norbert/models/quick_notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/views/quick_notes/notes_row.dart';
import 'package:FL1_Norbert/views/quick_notes/checklist_row.dart';
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

  Future<List<QuickNotes>> fillNotes(List<String> notesId) async {
    //User currentUser = context.read<Data>().currentUser;

    for (int i = 0; i < notesId.length; i++) {
      final DocumentSnapshot res = await quickNotes.doc(notesId[i]).get();
      final Map<String, dynamic> dbNote = res.data();

      final QuickNotes newNote = QuickNotes(
        description: dbNote['description'] as String,
        color: dbNote['color'] as String,
        type: dbNote['type'] as String,
      );

      notes.add(newNote);
    }
    return notes;
  }

  @override
  void initState() {
    // List<String> allNotes = context.watch<Data>().currentUser.quickNoteIds;
    //context.read<Data>().notes.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<QuickNotes> allNotes = context.watch<Data>().notes;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: allNotes.length,
          //itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            if (allNotes[index].type == 'quick') {
              return NotesRow(
                description: allNotes[index].description,
                noteColor: allNotes[index].color,
                type: allNotes[index].type,
              );
            } else if (allNotes[index].type == 'checklist') {
              return CheckListRow(
                title: allNotes[index].title,
                description: allNotes[index].description,
                noteColor: allNotes[index].color,
                type: allNotes[index].type,
                items: allNotes[index].items,
              );
            }
            return null;
          }),

      // return FutureBuilder(
      //   future: fillNotes(allNotes),
      //   builder:
      //       (BuildContext context, AsyncSnapshot<List<QuickNotes>> snapshot) {
      //     List<QuickNotes> displayedNotes = snapshot.data;
      //     return Padding(
      //       padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      //       child: ListView.builder(
      //         shrinkWrap: true,
      //         itemCount: allNotes.length,
      //         //itemCount: 5,
      //         itemBuilder: (BuildContext context, int index) =>
      //             NotesRow(description: displayedNotes[index].description),
      //       ),
      //     );
      //   },
      // );
    );
  }
}
