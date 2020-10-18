import 'package:FL1_Norbert/views/home/home.dart';
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

  void handleRedirectLogin() {
    //setState(() => _selectedView = const Home());
  }

  @override
  void initState() {
    _selectedView = Welcome(handleRedirectHome);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _selectedView;
  }

}