import 'package:bds_appdata/data/data.dart';
import 'package:bds_appdata/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OurTeamCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      elevation: 10.0,
      child: Column(
        children: teamMembers
            .map<OurTeamItem>((map) => OurTeamItem(
                  name: map['name'],
                  description: map['description'],
                  title: map['title'],
                  imageUrl: map['imageUrl'],
                ))
            .toList(),
      ),
    );
  }
}
