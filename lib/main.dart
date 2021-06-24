import 'package:flutter/material.dart';
import 'package:gmap/gmap/gmap_provider.dart';
import 'package:gmap/gmap/gmap_screen.dart';
import 'package:gmap/splashscreen/splash_provider.dart';
import 'package:provider/provider.dart';
import './splashscreen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Map',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => ChangeNotifierProvider<SplashProvider>(
              create: (context) => SplashProvider(),
              child: SplashScreen(),
            ),
        GmapScreen.route: (context) => ChangeNotifierProvider<GmapProvider>(
              create: (context) => GmapProvider(),
              child: GmapScreen(),
            ),
      },
    );
  }
}
