import 'package:FL1_Norbert/views/home/home.dart';
import 'package:FL1_Norbert/views/auth/register.dart';
import 'package:FL1_Norbert/views/auth/login.dart';
import 'package:FL1_Norbert/views/walkthrough/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewSelection extends StatefulWidget {
  @override
  _ViewSelectionState createState() => _ViewSelectionState();
}

class _ViewSelectionState extends State<ViewSelection> {
  Widget _selectedView;

  void handleRedirectHome() => setState(() => _selectedView = const Home());

  void handleRedirectRegister() {
    setState(() => _selectedView = const Register());
  }

  void handleRedirectLogin() {
    setState(() => _selectedView = const Login());
  }

  void handleRedirectWalkthrough() {
    setState(() =>
        _selectedView = Welcome(handleRedirectRegister, handleRedirectLogin));
  }

  @override
  void initState() {
    _selectedView =
        Home(); //Welcome(handleRedirectRegister, handleRedirectLogin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _selectedView;
  }
}
