import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/project.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ProjectCreation extends StatefulWidget {
  @override
  _ProjectCreationState createState() => _ProjectCreationState();
}

class _ProjectCreationState extends State<ProjectCreation> {
  TextEditingController textCtrl = TextEditingController();

  String colorChoice;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Titre',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                      TextField(
                        controller: textCtrl,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Couleur',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: RaisedButton(
                                child: colorChoice == 'purple'
                                    ? const Icon(Icons.check,
                                        color: Colors.black)
                                    : null,
                                color: purple,
                                disabledColor: purple,
                                onPressed: () =>
                                    setState(() => colorChoice = 'purple'),
                              )),
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: RaisedButton(
                                child: colorChoice == 'paleRed'
                                    ? const Icon(Icons.check,
                                        color: Colors.black)
                                    : null,
                                color: paleRed,
                                disabledColor: paleRed,
                                onPressed: () =>
                                    setState(() => colorChoice = 'paleRed'),
                              )),
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: RaisedButton(
                                child: colorChoice == 'green'
                                    ? const Icon(Icons.check,
                                        color: Colors.black)
                                    : null,
                                color: green,
                                disabledColor: green,
                                onPressed: () =>
                                    setState(() => colorChoice = 'green'),
                              )),
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: RaisedButton(
                                child: colorChoice == 'brown'
                                    ? const Icon(Icons.check,
                                        color: Colors.black)
                                    : null,
                                color: brown,
                                disabledColor: brown,
                                onPressed: () =>
                                    setState(() => colorChoice = 'brown'),
                              )),
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: RaisedButton(
                                child: colorChoice == 'offWhite'
                                    ? const Icon(Icons.check,
                                        color: Colors.black)
                                    : null,
                                color: offWhite,
                                disabledColor: offWhite,
                                onPressed: () =>
                                    setState(() => colorChoice = 'offWhite'),
                              )),
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: RaisedButton(
                                child: colorChoice == 'paleBlack'
                                    ? const Icon(Icons.check,
                                        color: Colors.black)
                                    : null,
                                color: paleBlack,
                                disabledColor: paleBlack,
                                onPressed: () =>
                                    setState(() => colorChoice = 'paleBlack'),
                              )),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    child: RaisedButton(
                        color: blue,
                        disabledColor: blue,
                        child: const Icon(Icons.check),
                        onPressed: () {
                          final Project tmp =
                              Project(name: textCtrl.text, color: colorChoice);
                          FirebaseFirestore.instance
                              .collection('projects')
                              .add(tmp.toJson())
                              .then((DocumentReference ref) {
                            tmp.id = ref.id;
                            context.read<Data>().addUserProject(tmp);
                            context
                                .read<Data>()
                                .currentUser
                                .projectIds
                                .add(ref.id);
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(context.read<Data>().currentUser.id)
                                .set(context.read<Data>().currentUser.toJson())
                                .then((_) => Navigator.pop(context));
                          });
                        }),
                  )
                ],
              ),
            )));
  }
}
