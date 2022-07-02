import 'package:flutter/material.dart';
import 'package:to_do_today/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Home(),
      theme: ThemeData(backgroundColor: Colors.indigo[900]),
    ),
  );
}
