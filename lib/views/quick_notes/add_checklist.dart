import 'package:FL1_Norbert/models/quick_notes.dart';
import 'package:FL1_Norbert/models/user.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/views/quick_notes/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/views/quick_notes/note_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:FL1_Norbert/models/data.dart';

class AddCheckList extends StatefulWidget {
  @override
  _AddCheckListState createState() => _AddCheckListState();
}

class _AddCheckListState extends State<AddCheckList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  String selected;
  //List<bool> _boxSelected;
  List<ListItem> items = <ListItem>[];
  List<Item> noteItems = <Item>[];

  final List<Map<String, dynamic>> allItems = <Map<String, dynamic>>[];
  //Map<String, dynamic> noteItems = <String, dynamic>{};
  //final bool _selected = false;
  String tmp3;

  void deleteItem(int index) {
    setState(() {
      if (items.length == 1) {
        items.clear();
      } else {
        items.removeWhere((ListItem element) => element.itemNb == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: NoteAppBar('Ajouter une checklist'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(
                  15.0,
                ),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 520,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                          textAlign: TextAlign.left,
                          controller: titleController,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Titre',
                            hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Theme(
                            data: ThemeData(
                              primaryColor: greySubtitles,
                            ),
                            child: TextFormField(
                              controller: descriptionController,
                              maxLines: 10,
                              minLines: 2,
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
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
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
                          height: 100,
                          width: 300,
                          margin: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              return items[index];
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                items.add(
                                  ListItem(
                                      deleteItem: deleteItem,
                                      label: 'Nouvel item',
                                      itemNb: items.length,
                                      title: (String tmp) {
                                        tmp3 = tmp;
                                        print(tmp3);
                                      }),
                                );
                                final Item newItem = Item();
                                newItem.done = false;
                                newItem.title = tmp3;

                                if (tmp3 != null) {
                                  final Map<String, dynamic> mapItem =
                                      <String, dynamic>{};

                                  noteItems.add(newItem);
                                  mapItem['title'] = newItem.title;
                                  mapItem['done'] = newItem.done;
                                  allItems.add(mapItem);
                                }
                              });
                            },
                            child: const Text(
                              '+ Ajouter un nouvel item',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                color: Colors.black,
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
                                        if (selected != 'red') {
                                          setState(() {
                                            selected = 'red';
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
                                            color: selected == 'red'
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
                                        if (selected != 'black') {
                                          setState(() {
                                            selected = 'black';
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
                                            color: selected == 'black'
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
                                            if (tmp3 != null) {
                                              final Item newItem = Item();
                                              final Map<String, dynamic>
                                                  lastItem =
                                                  <String, dynamic>{};
                                              newItem.done = false;
                                              newItem.title = tmp3;
                                              lastItem['title'] = newItem.title;
                                              lastItem['done'] = newItem.done;
                                              noteItems.add(newItem);
                                              allItems.add(lastItem);
                                            }
                                            // Get current user from provider
                                            final User user = context
                                                .read<Data>()
                                                .currentUser;

                                            // Create quickNote object
                                            final Map<String, dynamic>
                                                quickNote = <String, dynamic>{
                                              'title': titleController.text,
                                              'color': selected,
                                              'description':
                                                  descriptionController.text,
                                              'type': 'checklist',
                                              'items': allItems,
                                            };

                                            // Get quickNotes collection
                                            final CollectionReference
                                                quickNotes = FirebaseFirestore
                                                    .instance
                                                    .collection('quickNotes');

                                            // Add new quickNote to collection
                                            final DocumentReference newNote =
                                                await quickNotes.add(quickNote);

                                            if (newNote.id != null) {
                                              // Get db user
                                              final DocumentReference dbUsr =
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(user.id);

                                              // Add new note id to current user quickNotes list
                                              context
                                                  .read<Data>()
                                                  .addNotes(newNote.id);

                                              // save updated user quickNote list to db
                                              dbUsr.update(<String, dynamic>{
                                                '_quickNotes':
                                                    FieldValue.arrayUnion(
                                                        user.quickNoteIds)
                                              });
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
        },
      ),
    );
  }
}
