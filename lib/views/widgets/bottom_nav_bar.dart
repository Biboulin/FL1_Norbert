import 'package:FL1_Norbert/views/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}


class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {


  final List<BottomNavigationBarItem> _items = <BottomNavigationBarItem>[

    const BottomNavigationBarItem(
      icon: Icon(Icons.check_circle),
      label: 'Mes tâches',
    ),

    const BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: 'Menu',
    ),

    const BottomNavigationBarItem(
      icon: Icon(Icons.event_note),
      label:'Notes',
    ),

    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profil',
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