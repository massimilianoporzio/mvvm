import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); //private named constructor
  static const MyApp instance = MyApp._internal(); // single istance singleton
  factory MyApp() => instance; //factory per instance per avere singleton

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
