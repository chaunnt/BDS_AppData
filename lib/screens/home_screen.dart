import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/data/data.dart';
import 'package:bds_appdata/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            HomeScreenTabBar(),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
