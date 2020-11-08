import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/views/home/create_element_popup.dart';
import 'package:FL1_Norbert/views/profile/profile_app_bar.dart';
import 'package:FL1_Norbert/views/profile/profile_view.dart';
import 'package:FL1_Norbert/views/tasks/tasks_app_bar.dart';
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
    const Center(child: Text('menu')),
    const Center(child: Text('notes')),
    ProfileView(),
    const Center(child: Text('new task')),
    const Center(child: Text('new note')),
    const Center(child: Text('new checkList')),
  ];

  final List<PreferredSizeWidget> _appBars = <PreferredSizeWidget>[
    TaskAppBar(),
    null,
    null,
    ProfileAppBar(),
    null,
    null,
    null
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
      label: 'Notes',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        backgroundColor: blueBottomNavBar,
        selectedItemColor: whiteSelectedIcon,
        unselectedItemColor: greyUnselectedIcon,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex <= 3 ? _selectedIndex : 0,
        onTap: (int index) => setState(() {
          _selectedIndex = index;
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<int>(
            context: context,
            child: CreateElementPopup(),
          ).then((int index) => setState(() => _selectedIndex = index));
        },
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
