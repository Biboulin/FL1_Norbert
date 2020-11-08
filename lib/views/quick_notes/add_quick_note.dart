import 'package:FL1_Norbert/models/quick_notes.dart';
import 'package:FL1_Norbert/models/user.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/views/quick_notes/note_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:FL1_Norbert/models/data.dart';

class AddQuickNote extends StatefulWidget {
  @override
  _AddQuickNoteState createState() => _AddQuickNoteState();
}

class _AddQuickNoteState extends State<AddQuickNote> {
  List<String> quickNotesId = <String>[];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController descriptionController = TextEditingController();
  String selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: NoteAppBar('Ajouter une note'),
        ),
        body: Builder(builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 520,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Description',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 140.0),
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Theme(
                            data: ThemeData(
                              primaryColor: greySubtitles,
                            ),
                            child: TextFormField(
                              controller: descriptionController,
                              maxLines: 10,
                              minLines: 4,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(
                                  10.0,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: greySubtitles,
                                  ),
                                ),
                                hintText:
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.none,
                                  color: borderGrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Choisissez votre couleur',
                                style: TextStyle(fontFamily: 'Montserrat'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Wrap(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        if (selected != 'purple') {
                                          setState(() {
                                            selected = 'purple';
                                          });
                                        } else {
                                          setState(() {
                                            selected = '';
                                          });
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 5,
                                        ),
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: purple,
                                          border: Border.all(
                                            color: selected == 'purple'
                                                ? blueAppBar
                                                : Colors.transparent,
                                            width: 3.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (selected != 'paleRed') {
                                          setState(() {
                                            selected = 'paleRed';
                                          });
                                        } else {
                                          setState(() {
                                            selected = '';
                                          });
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 5,
                                        ),
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: paleRed,
                                          border: Border.all(
                                            color: selected == 'paleRed'
                                                ? blueAppBar
                                                : Colors.transparent,
                                            width: 3.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (selected != 'green') {
                                          setState(() {
                                            selected = 'green';
                                          });
                                        } else {
                                          setState(() {
                                            selected = '';
                                          });
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 5,
                                        ),
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: green,
                                          border: Border.all(
                                            color: selected == 'green'
                                                ? blueAppBar
                                                : Colors.transparent,
                                            width: 3.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (selected != 'paleBlack') {
                                          setState(() {
                                            selected = 'paleBlack';
                                          });
                                        } else {
                                          setState(() {
                                            selected = '';
                                          });
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 5,
                                        ),
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: paleBlack,
                                          border: Border.all(
                                            color: selected == 'paleBlack'
                                                ? blueAppBar
                                                : Colors.transparent,
                                            width: 3.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (selected != 'brown') {
                                          setState(() {
                                            selected = 'brown';
                                          });
                                        } else {
                                          setState(() {
                                            selected = '';
                                          });
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 5,
                                        ),
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: brown,
                                          border: Border.all(
                                            color: selected == 'brown'
                                                ? blueAppBar
                                                : Colors.transparent,
                                            width: 3.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        top: 40,
                                      ),
                                      child: ButtonTheme(
                                        minWidth: double.infinity,
                                        height: 55,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: RaisedButton(
                                          color: blueAppBar,
                                          onPressed: () async {
                                            // Get current user from provider
                                            final User user = context
                                                .read<Data>()
                                                .currentUser;

                                            print(user.email);
                                            // Create quickNote object
                                            final Map<String, String>
                                                quickNote = <String, String>{
                                              'color': selected,
                                              'description':
                                                  descriptionController.text,
                                              'type': 'quick',
                                            };

                                            final List<Map<String, String>>
                                                notes = <Map<String, String>>[];

                                            notes.add(quickNote);

                                            // Get quickNotes collection
                                            final CollectionReference
                                                quickNotes = FirebaseFirestore
                                                    .instance
                                                    .collection('quickNotes');

                                            // Add new quickNote to collection
                                            final DocumentReference newNote =
                                                await quickNotes.add(quickNote);

                                            final QuickNotes tmp = QuickNotes(
                                              description:
                                                  descriptionController.text,
                                              color: selected,
                                              type: 'quick',
                                            );

                                            context.read<Data>().setNotes(tmp);
                                            if (newNote.id != null) {
                                              // add quicknote id to currentUser in provider + update user data in firestore

                                              // Get db user
                                              final DocumentReference dbUsr =
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(user.id);

                                              try {
                                                // Add new note id to user quickNotes list
                                                context
                                                    .read<Data>()
                                                    .addNotes(newNote.id);

                                                // save updated user quickNote list to db
                                                dbUsr.update(<String, dynamic>{
                                                  '_quickNotes':
                                                      FieldValue.arrayUnion(
                                                          user.quickNoteIds)
                                                });
                                              } catch (e) {
                                                print(e);
                                              }
                                              const SnackBar snackBar =
                                                  SnackBar(
                                                content: Text(
                                                  'Votre note à été ajouté !',
                                                ),
                                                duration: Duration(seconds: 1),
                                              );
                                              Scaffold.of(context)
                                                  .showSnackBar(snackBar)
                                                  .closed
                                                  .then((SnackBarClosedReason
                                                      reason) {
                                                Navigator.pop(context);
                                              });
                                            } else {
                                              const SnackBar snackBar = SnackBar(
                                                  content: Text(
                                                      'Une erreur est survenue'));
                                              Scaffold.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                          child: const Text(
                                            'Ajouter',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 18,
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
