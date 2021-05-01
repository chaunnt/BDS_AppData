import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bds_appdata/config/palette.dart';

class ContactScreen extends StatelessWidget {
  static const route = '/contact';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: screenSize.height * 2 / 5,
              decoration: BoxDecoration(
                color: Palette.hodacePurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(72.0),
                  bottomRight: Radius.circular(72.0),
                ),
              ),
            ),
            Positioned(
              top: -50.0,
              left: screenSize.width * 2 / 4,
              child: Image(
                color: Palette.hodaceBox,
                image: AssetImage('assets/images/hodace_box_small.png'),
              ),
            ),
            Positioned(
              top: 50.0,
              left: screenSize.width * 0.5 / 4,
              child: Container(
                width: 80.0,
                height: 80.0,
                child: Image(
                  color: Palette.hodaceBox,
                  image: AssetImage('assets/images/hodace_box_small.png'),
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 2 / 5 - 60.0,
              left: 0.0,
              child: Image(
                image: AssetImage('assets/images/hodace_box_small.png'),
              ),
            ),
            Positioned(
              right: -10.0,
              top: screenSize.height * 1 / 5,
              child: Image(
                color: Palette.hodaceBox,
                image: AssetImage('assets/images/hodace_box_small.png'),
              ),
            ),
            Positioned(
              left: 24.0,
              top: 16.0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            ContactScreenCard(),
            Positioned(
              right: 0.0,
              left: 0.0,
              bottom: 24.0,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  Texts.contactFooter,
                  style: TextStyle(color: Palette.grey, fontSize: 12.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
