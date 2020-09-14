import 'package:flutter/material.dart';
import 'package:food_finder/screens/splash/components/body.dart';

import '../../size_config.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
