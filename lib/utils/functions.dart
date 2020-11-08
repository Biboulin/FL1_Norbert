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
      return const Color(0xFF00A27C);
    case 'purple':
      return const Color(0xFF6074F9);
    case 'brown':
      return const Color(0xFFB38344);
    case 'paleBlack':
      return const Color(0xFF394856);
    case 'offWhite':
      return const Color(0xFFF4F4F4);
    case 'paleRed':
      return const Color(0xFFDE695B);
    default:
      return Colors.transparent;
  }
}

User getUserById(List<User> users, String id) {
  return users.firstWhere((User element) => element.id == id);
}
