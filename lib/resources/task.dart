import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;
  bool isDone;

  Task({required this.title, required this.description, this.isDone = false});
}

List<Task> tasks = [];

class Data {
  final List<IconData> icons = [
    Icons.list,
    Icons.work,
    Icons.headphones,
    Icons.airplanemode_active,
    Icons.book,
    Icons.home,
    Icons.palette,
    Icons.shopping_cart,
  ];

  final List<Color> colors = [
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.purple,
    const Color.fromARGB(255, 44, 173, 124),
  ];

  final List<String> titles = [
    'All',
    'Work',
    'Music',
    'Travel',
    'Study',
    'Home',
    'Art',
    'Shopping',
  ];

  final List<String> subtitles = [
    '${tasks.length} Tasks',
    '0 Tasks',
    '0 Tasks',
    '0 Tasks',
    '0 Tasks',
    '0 Tasks',
    '0 Tasks',
    '0 Tasks',
  ];
}
