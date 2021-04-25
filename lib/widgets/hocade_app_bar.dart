import 'dart:math';

import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/config/texts.dart';
import 'package:flutter/material.dart';

class HocadeAppBar extends StatelessWidget {
  void _onNotificationPress() {}

  void _onRightMenuPress() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              Texts.hocade,
              style: TextStyle(
                color: Palette.hocadePurple,
                fontSize: 30.0,
              ),
            ),
          ),
          IconButton(
            onPressed: _onNotificationPress,
            icon: Icon(
              Icons.notifications,
              color: Palette.hocadePurple,
            ),
          ),
          IconButton(
            onPressed: _onRightMenuPress,
            icon: Transform.rotate(
              angle: 3 * pi / 2,
              child: Icon(Icons.bar_chart, color: Palette.hocadePurple),
            ),
          )
        ],
      ),
    );
  }
}
