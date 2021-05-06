import 'package:bds_appdata/config/texts.dart';
import 'package:flutter/material.dart';

class OurValuesRow extends StatelessWidget {
  final Map<String, AssetImage> valuesMap = {
    Texts.aboutCommitment: AssetImage('assets/images/commitment.png'),
    Texts.aboutRelationship: AssetImage('assets/images/relationship.png'),
    Texts.aboutPositive: AssetImage('assets/images/positive.png'),
    Texts.aboutGrowth: AssetImage('assets/images/growth.png'),
  };

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          ...valuesMap
              .map(
                (key, value) => MapEntry(
                  key,
                  Column(
                    children: [
                      Image(
                        image: value,
                      ),
                      Text(key)
                    ],
                  ),
                ),
              )
              .values
              .toList()
        ],
      ),
    );
  }
}
