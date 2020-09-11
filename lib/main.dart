import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_finder/routes.dart';
import 'package:food_finder/screens/splash/splash_screen.dart';
import 'package:food_finder/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Finder',
      theme: theme(),
      initialRoute: SplashScreen.id,
      routes: routes,
    );
  }
}
