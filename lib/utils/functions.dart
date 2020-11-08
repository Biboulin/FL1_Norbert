import 'package:FL1_Norbert/models/user.dart';
import 'package:flutter/material.dart';

Color getColor(String color) {
  switch (color) {
    case 'red':
      return Colors.red;
    case 'grey':
      return Colors.grey;
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;
    case 'purple':
      return Colors.purple;
    default:
      return Colors.transparent;
  }
}

User getUserById(List<User> users, String id) {
  return users.firstWhere((User element) => element.id == id);
}
