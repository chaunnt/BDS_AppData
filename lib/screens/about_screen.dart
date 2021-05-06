import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/data/data.dart';
import 'package:bds_appdata/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const route = '/about';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Palette.hodacePurple,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      Texts.aboutUs,
                      style: TextStyle(
                        color: Palette.hodacePurple,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 50.0)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  Texts.aboutDescription,
                  maxLines: 10,
                  textAlign: TextAlign.justify,
                ),
              ),
              Text(
                Texts.aboutValues,
                style: TextStyle(
                  color: Palette.hodacePurple,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: OurValuesRow(),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      teamMembers.length * (screenSize.width / 3 + 50) + 48.0,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: screenSize.height / 6,
                      decoration: BoxDecoration(
                        color: Palette.contactYellow,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      top: 24.0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          Texts.aboutOurTeam,
                          style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      top: screenSize.height / 12 + 8.0,
                      child: OurTeamCard(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
