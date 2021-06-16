import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:igdb/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const double maxFinite = 230;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GameFy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AnimatedSplashScreen(
          duration: 2500,
          splashIconSize: maxFinite,
          splash: Image.asset('assets/img/logo.png'),
          splashTransition: SplashTransition.scaleTransition,
          nextScreen: MainScreen(),
          backgroundColor: Colors.blueGrey[900],
        ));
  }
}
