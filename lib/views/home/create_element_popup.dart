import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FL1_Norbert/views/quick_notes/add_quick_note.dart';
import 'package:FL1_Norbert/views/quick_notes/add_checklist.dart';

class CreateElementPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Container>[
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context, 4),
              child: const Text('Nouvelle tâche'),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context, AddQuickNote()),
              // onPressed: () => Navigator.push(
              //   context,
              //   MaterialPageRoute<Widget>(
              //     builder: (BuildContext context) => AddQuickNote(),
              //   ),
              // ),
              child: const Text('Nouvelle note'),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context, AddCheckList()),
              // onPressed: () => Navigator.push(
              //   context,
              //   MaterialPageRoute<Widget>(
              //     builder: (BuildContext context) => AddCheckList(),
              //   ),
              // ),
              child: const Text('Nouvelle check-list'),
            ),
          ),
        ],
      ),
    );
  }
}
