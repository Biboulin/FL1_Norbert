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
              onPressed: () => null,
              child: const Text('new task'),
            ),
          ),

          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => null,
              child: const Text('new element'),
            ),
          ),

          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => null,
              child: const Text('new event'),
            ),
          ),

        ],
      ),
    );
  }
}