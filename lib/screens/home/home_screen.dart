import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Finder'),
      ),
    );
  }
}
