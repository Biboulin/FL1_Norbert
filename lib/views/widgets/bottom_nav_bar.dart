import 'package:FL1_Norbert/views/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}


class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {


  final List<BottomNavigationBarItem> _items = <BottomNavigationBarItem>[

    BottomNavigationBarItem(
      icon: Icon(Icons.check_circle),
      title: const Text('Mes tâches'),
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      title: const Text('Menu'),
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.event_note),
      title: const Text('Notes'),
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: const Text('Profil'),
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items,
      backgroundColor: blueBottomNavBar,
      selectedItemColor: whiteSelectedIcon,
      unselectedItemColor: greyUnselectedIcon,
      type: BottomNavigationBarType.fixed,
    );
  }

}