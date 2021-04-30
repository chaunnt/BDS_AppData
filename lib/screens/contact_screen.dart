import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  static const route = '/contact';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Contact screen'),
        ),
      ),
    );
  }
}
