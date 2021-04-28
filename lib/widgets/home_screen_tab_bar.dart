import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/config/texts.dart';
import 'package:flutter/material.dart';

class HomeScreenTabBar extends StatefulWidget {
  @override
  _HomeScreenTabBarState createState() => _HomeScreenTabBarState();
}

class _HomeScreenTabBarState extends State<HomeScreenTabBar>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[
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
        labelColor: Palette.hocadePurple,
        unselectedLabelColor: Palette.grey,
        indicatorColor: Palette.hocadePurple,
        controller: _tabController,
        tabs: _tabs,
        isScrollable: true,
      ),
    );
  }
}
