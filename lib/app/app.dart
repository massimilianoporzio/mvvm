import 'package:flutter/material.dart';
import 'package:mvvm/core/routes/routes_manager.dart';

import '../core/presentation/resources/theme_manager.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
