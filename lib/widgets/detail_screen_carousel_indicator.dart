import 'package:bds_appdata/config/palette.dart';
import 'package:flutter/material.dart';

class DetailScreenCarouselIndicator extends StatelessWidget {
  final List<String> imageList;
  final int currentIndex;

  const DetailScreenCarouselIndicator({
    @required this.imageList,
    @required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageList
          .asMap()
          .map(
            (key, value) => MapEntry(
              key,
              Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == key
                      ? Colors.white
                      : Palette.grey,
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
