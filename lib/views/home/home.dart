import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/views/home/create_element_popup.dart';
import 'package:FL1_Norbert/views/tasks/tasks_view.dart';
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

  int _selectedIndex = 0;

  final List<Widget> _views = <Widget>[
    TasksView(),
    const Center(child: Text('yo')),
    const Center(child: Text('salut')),
    const Center(child: Text('ahdzk')),
  ];

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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        backgroundColor: blueBottomNavBar,
        selectedItemColor: whiteSelectedIcon,
        unselectedItemColor: greyUnselectedIcon,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (int index) => setState(() {
          _selectedIndex = index;
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<CreateElementPopup>(
          context: context,
          child: CreateElementPopup(),
        ),
        child: const Icon(Icons.add),
        backgroundColor: blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SizedBox.expand(
          child: _views[_selectedIndex],
        ),
      ),
    );
  }
}