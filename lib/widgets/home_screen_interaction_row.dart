import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/models/models.dart';
import 'package:flutter/material.dart';

class HomeScreenInteractionRow extends StatelessWidget {
  final RealEstate realEstate;

  HomeScreenInteractionRow({@required this.realEstate});

  @override
  Widget build(BuildContext context) {
    final Map<IconData, String> _interactionItems = {
      Icons.remove_red_eye: realEstate.interaction.views.toString(),
      Icons.chat_bubble_outline: realEstate.interaction.comments.toString(),
      Icons.call: realEstate.interaction.calls.toString(),
      Icons.share: realEstate.interaction.shares.toString(),
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _interactionItems
          .map((key, value) {
            return MapEntry(
              key,
              Row(
                children: [
                  Text(
                    value,
                    style: TextStyle(fontSize: 10.0, color: Palette.grey),
                  ),
                  SizedBox(width: 4.0),
                  Icon(
                    key,
                    size: 15.0,
                    color: Palette.grey,
                  ),
                ],
              ),
            );
          })
          .values
          .toList(),
    );
  }
}
