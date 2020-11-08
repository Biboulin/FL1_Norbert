import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/models/user.dart' as user;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:FL1_Norbert/views/home/home.dart';

class Register extends StatefulWidget {
  const Register();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _validForm = true;
  String errorMsg;
  // User newUser = User();

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 80,
                ),
                width: 330,
                child: const Text(
                  'Bonjour !',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 52,
                    color: darkBlue,
                  ),
                ),
              ),
              Container(
                child: const Text(
                  'Créer un compte pour continuer.',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 24,
                    color: greySubtitles,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextFormField(
                          controller: firstnameController,
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
                            hintText: 'Prénom',
                            hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: greySubtitles,
                            ),
                            errorStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: red,
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              if (_validForm) {
                                _validForm = false;
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text('Please enter some text'),
                                    elevation: 350,
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
                      Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextFormField(
                          controller: lastnameController,
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
                            hintText: 'Nom',
                            hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: greySubtitles,
                            ),
                            errorStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: red,
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              if (_validForm) {
                                _validForm = false;
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text('Please enter some text'),
                                    elevation: 350,
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
                      Card(
                        margin: const EdgeInsets.only(bottom: 15),
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
                            hintText: 'Entrer votre email',
                            hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: greySubtitles,
                            ),
                            errorStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: red,
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              if (_validForm) {
                                _validForm = false;
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text('Please enter some text'),
                                    elevation: 350,
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
                      Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
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
                            hintText: 'Entrer votre mot de passe',
                            hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: greySubtitles,
                            ),
                            errorStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: red,
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              if (_validForm) {
                                _validForm = false;
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text('Please enter some text'),
                                    elevation: 350,
                                    backgroundColor: red,
                                    onVisible: () {
                                      _validForm = true;
                                    },
                                  ),
                                );
                              }
                              return null;
                            } else if (value.length < 8) {
                              if (_validForm) {
                                _validForm = false;
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text("Passwords doesn't match !"),
                                    elevation: 350,
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
                      Card(
                        margin: const EdgeInsets.only(bottom: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextFormField(
                          controller: confirmPwdController,
                          obscureText: true,
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
                            hintText: 'Confirmer votre mot de passe',
                            hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: greySubtitles,
                            ),
                            errorStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: red,
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              if (_validForm) {
                                _validForm = false;
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text('Please enter some text'),
                                    backgroundColor: red,
                                    onVisible: () {
                                      _validForm = true;
                                    },
                                  ),
                                );
                              }
                              return null;
                              // return 'Please enter some text';
                            } else if (value != passwordController.text) {
                              if (_validForm) {
                                _validForm = false;
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text("Passwords doesn't match !"),
                                    elevation: 350,
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
                      ButtonTheme(
                          minWidth: double.infinity,
                          height: 55,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: RaisedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate() &&
                                  _validForm) {
                                try {
                                  final UserCredential tmp =
                                      await auth.createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  print(tmp);
                                  final Map<String, dynamic> usrData =
                                      <String, dynamic>{
                                    'firstName': firstnameController.text,
                                    'lastName': lastnameController.text,
                                    'email': emailController.text,
                                    'firebaseId': tmp.user.uid,
                                    'accessToken': tmp.user.refreshToken,
                                  };

                                  final CollectionReference users =
                                      FirebaseFirestore.instance
                                          .collection('users');

                                  users.add(usrData).then(
                                        (DocumentReference value) =>
                                            print(value.id),
                                      );

                                  // Save current user to provider
                                  final user.User currentUser =
                                      user.User.fromJson(usrData);

                                  Navigator.push<Widget>(
                                    context,
                                    MaterialPageRoute<Widget>(
                                      builder: (BuildContext context) =>
                                          const Home(),
                                    ),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    errorMsg =
                                        'The password provided is too weak.';
                                  } else if (e.code == 'email-already-in-use') {
                                    errorMsg =
                                        'The account already exists for that email.';
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
                            child: const Text(
                              "S'inscrire",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: white,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
