import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenTabBar extends StatefulWidget {
  @override
  _HomeScreenTabBarState createState() => _HomeScreenTabBarState();
}

class _HomeScreenTabBarState extends State<HomeScreenTabBar>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[
    Tab(text: Texts.all),
    Tab(text: Texts.bietThu),
    Tab(text: Texts.nhaPho),
    Tab(text: Texts.datNen),
    Tab(text: Texts.chungCu),
    Tab(text: Texts.datKhuCongNghiep),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        Get.find<RealEstateController>()
            .updateRealEstateCategory(_tabs[_tabController.index].text);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return true;
      },
      child: TabBar(
        labelColor: Palette.hodacePurple,
        unselectedLabelColor: Palette.grey,
        indicatorColor: Palette.hodacePurple,
        controller: _tabController,
        tabs: _tabs,
        isScrollable: true,
      ),
    );
  }
}
