import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:FL1_Norbert/views/home/home.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Center(
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
                                      content:
                                          const Text('Please enter some text'),
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
          );
        },
      ),
    );
  }
}
