import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/models/models.dart';
import 'package:bds_appdata/screens/screens.dart';
import 'package:bds_appdata/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RealEstateCard extends StatelessWidget {
  final RealEstate realEstate;

  const RealEstateCard({@required this.realEstate});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailScreen.route,
            arguments: {'realEstate': realEstate},
          );
        },
        child: Container(
          width: screenSize.width * 2 / 3,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 5,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          child: Image.network(
                            realEstate.images[0],
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace stackTrace) {
                              print('Error loading image ' +
                                  exception.toString());
                              return Image(
                                image: AssetImage(
                                    'assets/images/placeholder_image.png'),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                            ),
                            color: Colors.white,
                          ),
                          height: 25.0,
                          width: screenSize.width * 4 / 15,
                          child: Center(
                              child: Text(
                            realEstate.price,
                            style: TextStyle(
                                color: Palette.hodacePurple,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        child: Container(
                            color: Colors.white.withOpacity(0.7),
                            width: screenSize.width * 2 / 3 -
                                screenSize.width * 4 / 15,
                            height: 20.0,
                            child: HomeScreenInteractionRow(
                                realEstate: realEstate)),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                realEstate.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                realEstate.address,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        color: Palette.hodacePurple,
                        icon: Icon(Icons.favorite_outline),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
