import 'package:flutter/material.dart';
import 'package:food_finder/screens/home/home_screen.dart';
import 'package:food_finder/screens/loading/loading_screen.dart';
import 'package:food_finder/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.id: (context) => SplashScreen(),
  LoadingScreen.id: (context) => LoadingScreen(),
  HomeScreen.id: (context) => HomeScreen(),
};
