import 'package:bds_appdata/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailScreenCarouselContainer extends StatefulWidget {
  final List<String> realEstateImages;

  const DetailScreenCarouselContainer({@required this.realEstateImages});

  @override
  _DetailScreenCarouselContainerState createState() =>
      _DetailScreenCarouselContainerState();
}

class _DetailScreenCarouselContainerState
    extends State<DetailScreenCarouselContainer> {
  int _currentIndex = 0;

  void onCarouselSlides(index, reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailScreenCarousel(
          imageList: widget.realEstateImages,
          onCarouselSlides: onCarouselSlides,
        ),
        SizedBox(height: 16.0),
        DetailScreenCarouselIndicator(
          imageList: widget.realEstateImages,
          currentIndex: _currentIndex,
        ),
      ],
    );
  }
}
