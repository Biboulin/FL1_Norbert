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
              onPressed: () => Navigator.pop(context, 4),
              child: const Text('Nouvelle tâche'),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context, 5),
              child: const Text('Nouvelle note'),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context, 6),
              child: const Text('Nouvelle check-list'),
            ),
          ),
        ],
      ),
    );
  }
}
