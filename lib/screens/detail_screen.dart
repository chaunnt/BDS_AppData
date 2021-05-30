import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../models/real_estate.dart';

class DetailScreen extends StatefulWidget {
  final RealEstate realEstate;

  const DetailScreen({this.realEstate});

  @override
  State<StatefulWidget> createState() {
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen> {
  int _currentIndex = 0;

  void onCarouselSlides(index, reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onContactNowPress() {}

  void _onBackButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.hodacePurple,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => _onBackButton(context),
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            DetailScreenCarousel(
              imageList: widget.realEstate.images,
              onCarouselSlides: onCarouselSlides,
            ),
            SizedBox(height: 16.0),
            DetailScreenCarouselIndicator(
              imageList: widget.realEstate.images,
              currentIndex: _currentIndex,
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 24.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.realEstate.price,
                                style: TextStyle(
                                    color: Palette.hodacePurple,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.realEstate.address,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Palette.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          color: Palette.hodacePurple,
                          icon: Icon(Icons.share_outlined),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Palette.hodacePurple,
                          icon: Icon(Icons.favorite),
                          onPressed: () {},
                        )
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Text(widget.realEstate.description),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(screenSize.width - 96.0, 50.0),
                        backgroundColor: Palette.hodacePurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: _onContactNowPress,
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              Texts.contactNow,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              Texts.phoneNumber,
                              style: TextStyle(color: Colors.white54),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
