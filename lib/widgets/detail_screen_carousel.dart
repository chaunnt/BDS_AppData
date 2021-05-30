import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailScreenCarousel extends StatelessWidget {
  final List<String> imageList;
  final Function onCarouselSlides;

  DetailScreenCarousel(
      {@required this.imageList, @required this.onCarouselSlides});

  List<Widget> _buildImageSliders(List<String> imageUrls) {
    return imageUrls
        .map(
          (item) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Image.network(item, fit: BoxFit.cover)),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _buildImageSliders(imageList),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 1.5,
        onPageChanged: onCarouselSlides,
      ),
    );
  }
}
