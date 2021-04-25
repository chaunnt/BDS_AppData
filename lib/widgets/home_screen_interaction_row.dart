import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/models/models.dart';
import 'package:flutter/material.dart';

class HomeScreenInteractionRow extends StatelessWidget {
  final RealEstate realEstate;

  HomeScreenInteractionRow({@required this.realEstate});

  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> _interactionItems = {
      realEstate.interaction.views.toString(): Icons.remove_red_eye,
      realEstate.interaction.comments.toString(): Icons.chat_bubble_outline,
      realEstate.interaction.calls.toString(): Icons.call,
      realEstate.interaction.shares.toString(): Icons.share,
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _interactionItems
          .map(
            (key, value) => MapEntry(
              key,
              Row(
                children: [
                  Text(
                    key,
                    style: TextStyle(fontSize: 10.0, color: Palette.grey),
                  ),
                  Icon(
                    value,
                    size: 15.0,
                    color: Palette.grey,
                  ),
                ],
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
