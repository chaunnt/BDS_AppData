import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const route = '/about';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('About screen'),
        ),
      ),
    );
  }
}
