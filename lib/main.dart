import 'package:bds_appdata/routes.dart';
import 'package:bds_appdata/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BDS_App',
      home: NavigationScreen(),
      routes: routes,
    );
  }
}