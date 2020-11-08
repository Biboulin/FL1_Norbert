import 'package:FL1_Norbert/models/quick_notes.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/views/home/home.dart';
import 'package:FL1_Norbert/models/data.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:FL1_Norbert/models/user.dart' as user;

class Login extends StatefulWidget {
  const Login();

  // final Function handleRedirectHome;
  // final Function handleRedirectWalkthrough;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _validForm = true;
  String errorMsg;

  @override
  void initState() {
    super.initState();
    Provider.of<Data>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 150,
                        left: 20,
                      ),
                      child: const Text(
                        'Re bonjour !',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          color: darkBlue,
                          fontSize: 52,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: const Text(
                        'Identifiez vous pour continuer !',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          color: greySubtitles,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            top: 50,
                          ),
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: Card(
                            // margin: const EdgeInsets.only(bottom: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: 15,
                                  bottom: 11,
                                  top: 11,
                                  right: 15,
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  color: greySubtitles,
                                ),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  if (_validForm) {
                                    _validForm = false;
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text(
                                            'Please enter some text'),
                                        backgroundColor: red,
                                        onVisible: () {
                                          _validForm = true;
                                        },
                                      ),
                                    );
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                          ),
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextFormField(
                              obscureText: true,
                              controller: passwordController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: 15,
                                  bottom: 11,
                                  top: 11,
                                  right: 15,
                                ),
                                hintText: 'Mot de passe',
                                hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  color: greySubtitles,
                                ),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  if (_validForm) {
                                    _validForm = false;
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text(
                                            'Please enter some text'),
                                        backgroundColor: red,
                                        onVisible: () {
                                          _validForm = true;
                                        },
                                      ),
                                    );
                                  }
                                  return null;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 30,
                          ),
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: ButtonTheme(
                            minWidth: double.infinity,
                            height: 55,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: RaisedButton(
                              child: const Text(
                                'Se connecter',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  color: white,
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate() &&
                                    _validForm) {
                                  try {
                                    final UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );

                                    context.read<Data>().setUsr(null);
                                    context.read<Data>().notes.clear();
                                    context.read<Data>().tasks.clear();
                                    context.read<Data>().displayTasks.clear();
                                    context.read<Data>().projects.clear();

                                    final CollectionReference users =
                                        FirebaseFirestore.instance
                                            .collection('users');

                                    final CollectionReference notesCollection =
                                        FirebaseFirestore.instance
                                            .collection('quickNotes');

                                    final QuerySnapshot exists = await users
                                        .where(
                                          'firebaseId',
                                          isEqualTo: userCredential.user.uid,
                                        )
                                        .get();

                                    final Map<String, dynamic> data =
                                        exists.docs[0].data();

                                    final List<dynamic> notes =
                                        data['_quickNotes'] as List<dynamic>;
                                    final dynamic projects = data['_projects'];

                                    for (int i = 0; i < notes.length; i++) {
                                      final DocumentSnapshot res =
                                          await notesCollection
                                              .doc(notes[i] as String)
                                              .get();

                                      final dynamic dbNote = res.data();
                                      print(dbNote);
                                      final QuickNotes newNote = QuickNotes(
                                        description:
                                            dbNote['description'] as String,
                                        color: dbNote['color'] as String,
                                        type: dbNote['type'] as String,
                                      );

                                      context.read<Data>().setNotes(newNote);
                                    }

                                    final Map<String, dynamic> usrData =
                                        <String, dynamic>{
                                      'firstName': data['firstName'],
                                      'lastName': data['lastName'],
                                      'email': data['email'],
                                    };
                                    usrData.putIfAbsent(
                                      'id',
                                      () => exists.docs[0].id,
                                    );

                                    usrData['_quickNotes'] = notes;
                                    usrData['_projects'] = projects;
                                    final user.User currentUser =
                                        user.User.fromJson(usrData);

                                    context.read<Data>().setUsr(currentUser);
                                    Navigator.push<Widget>(
                                      context,
                                      MaterialPageRoute<Widget>(
                                        builder: (BuildContext context) =>
                                            const Home(),
                                      ),
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      errorMsg =
                                          'User not found ! Try to register before';
                                    } else if (e.code == 'wrong-password') {
                                      errorMsg = 'Wrong password provided !';
                                    }
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(errorMsg),
                                        backgroundColor: red,
                                      ),
                                    );
                                    return null;
                                  }
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
