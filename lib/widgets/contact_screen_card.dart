import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreenCard extends StatelessWidget {
  final Map<IconData, String> infoData = {
    FontAwesomeIcons.facebookMessenger: Texts.contactFacebook,
    FontAwesomeIcons.linkedin: Texts.contactLinkedIn,
    FontAwesomeIcons.globe: Texts.contactWeb,
    FontAwesomeIcons.telegram: Texts.contactTelegram,
    Icons.location_on_rounded: Texts.contactLocation,
  };

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: screenSize.height * 8 / 10,
        width: screenSize.width - 48.0,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Image(
                    width: screenSize.width / 3,
                    image: AssetImage('assets/images/hodace_label.png'),
                  ),
                ),
                SizedBox(height: screenSize.height / 11),
                Text(
                  Texts.contactUs,
                  style: TextStyle(
                    color: Palette.contactYellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 32.0),
                ...infoData
                    .map(
                      (key, value) => MapEntry(
                        key,
                        ContactScreenInfo(iconData: key, infoText: value),
                      ),
                    )
                    .values
                    .toList(),
                SizedBox(height: 32.0),
                Text(
                  Texts.contactPropagandaTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Palette.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  Texts.contactUsPropaganda,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Palette.grey,
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
