import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text('Profil', style: TextStyle(color: Colors.black)),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
