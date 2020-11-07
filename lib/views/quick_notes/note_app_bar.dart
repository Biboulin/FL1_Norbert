import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoteAppBar extends StatelessWidget with PreferredSizeWidget {
  NoteAppBar(this.noteType);

  final String noteType;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: blueAppBar,
      centerTitle: true,
      title: Text(
        noteType,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
