import 'package:FL1_Norbert/views/new_element/create_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              onPressed: () => Navigator.pop(context, CreateTask()),
              child: const Text('Nouvelle tâche'),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text('Nouvelle note'),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text('Nouvelle check-list'),
            ),
          ),
        ],
      ),
    );
  }
}
