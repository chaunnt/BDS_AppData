import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/data/data.dart';
import 'package:bds_appdata/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: HomeScreenTabBar(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                HomeScreenFilter(
                  filterName: Texts.khuVuc,
                  filterOptions: dummyKhuVucFilterOptions,
                ),
                HomeScreenFilter(
                  filterName: Texts.mucGia,
                  filterOptions: dummyMucGiaFilterOptions,
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 48.0),
                  child: Container(
                    color: Palette.hodacePurple,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 8.0),
                  child: Text(
                    Texts.raoBan,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32.0,
                    bottom: 16.0,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Container(
                      height: constraints.maxHeight,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dummyForSaleRealEstateData.length,
                        itemBuilder: (buildContext, index) => RealEstateCard(
                          realEstate: dummyForSaleRealEstateData[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 48.0),
                  child: Container(
                    color: Palette.hodacePurple,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 8.0),
                  child: Text(
                    Texts.choThue,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32.0,
                    bottom: 16.0,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Container(
                      height: constraints.maxHeight,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dummyForRentRealEstateData.length,
                        itemBuilder: (buildContext, index) => RealEstateCard(
                          realEstate: dummyForRentRealEstateData[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
