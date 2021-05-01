import 'package:bds_appdata/screens/screens.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  ContactScreen.route: (context) => ContactScreen(),
  AboutScreen.route: (context) => AboutScreen()
};