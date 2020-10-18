import 'package:FL1_Norbert/views/utils/colors.dart';
import 'package:FL1_Norbert/views/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: const Icon(Icons.add),
        backgroundColor: redFloatingButton,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(),
    );
  }
}