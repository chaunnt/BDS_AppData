import 'package:bds_appdata/config/palette.dart';
import 'package:flutter/material.dart';

class OurTeamItem extends StatelessWidget {
  final String name;
  final String title;
  final String description;
  final String imageUrl;

  const OurTeamItem({
    @required this.name,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double avatarRadius = constraints.maxWidth / 6 - 12.0;

      return Container(
        height: constraints.maxWidth * 1 / 3 + 50.0,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
          child: Stack(
            children: [
              Positioned(
                top: avatarRadius / 2,
                left: 8.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        height: 50.0,
                        width: constraints.maxWidth - avatarRadius - 48.0,
                        padding: EdgeInsets.only(left: avatarRadius * 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  color: Palette.hodacePurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Palette.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: avatarRadius * 2,
                        right: 24.0,
                      ),
                      width: constraints.maxWidth - avatarRadius - 24.0,
                      child: Text(
                        description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: avatarRadius,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ],
          ),
        ),
      );
    });
  }
}
