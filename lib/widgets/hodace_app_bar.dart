import 'dart:math';

import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/screens/screens.dart';
import 'package:flutter/material.dart';

class HodaceAppBar extends StatelessWidget {
  void _onNotificationPress() {}

  final List<String> menuOptions = [
    Texts.aboutUs,
    Texts.contact,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              Texts.hodace,
              style: TextStyle(
                color: Palette.hodacePurple,
                fontSize: 30.0,
              ),
            ),
          ),
          IconButton(
            onPressed: _onNotificationPress,
            icon: Icon(
              Icons.notifications,
              color: Palette.hodacePurple,
            ),
          ),
          PopupMenuButton(
            onSelected: (option) {
              final routeName = option == menuOptions[0]
                  ? AboutScreen.route
                  : ContactScreen.route;
              Navigator.pushNamed(context, routeName);
            },
            icon: Transform.rotate(
              angle: 3 * pi / 2,
              child: Icon(Icons.bar_chart, color: Palette.hodacePurple),
            ),
            itemBuilder: (buildContect) => menuOptions
                .map(
                  (option) => PopupMenuItem(
                    child: Text(option),
                    value: option,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.hodacePurple,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
