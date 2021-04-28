import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/screens/screens.dart';
import 'package:bds_appdata/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  int _currentIndex = 0;
  List<IconData> _icons = [
    Icons.home,
    Icons.search,
    FeatherIcons.activity,
    Icons.favorite,
    Icons.person_outline,
  ];

  void _onBottomNavigationItemTap(int index) {
    this.setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: HocadeAppBar(),
          preferredSize: Size(
            double.infinity,
            screenSize.height / 10,
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              onTap: _onBottomNavigationItemTap,
              currentIndex: _currentIndex,
              selectedItemColor: Palette.hocadePurple,
              unselectedItemColor: Palette.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: _icons
                  .map((iconData) =>
                      BottomNavigationBarItem(icon: Icon(iconData), label: ''))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
