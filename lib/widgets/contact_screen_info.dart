import 'package:bds_appdata/config/palette.dart';
import 'package:flutter/material.dart';

class ContactScreenInfo extends StatelessWidget {
  final IconData iconData;
  final String infoText;

  const ContactScreenInfo({
    @required this.iconData,
    @required this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        height: 50.0,
        child: Row(
          children: [
            SizedBox(width: 16.0),
            Icon(
              iconData,
              color: Palette.hodacePurple,
            ),
            SizedBox(width: 16.0),
            Text(
              infoText,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Palette.hodacePurple,
                fontSize: 13.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
