import 'package:flutter/material.dart';
import 'package:gmap/splashscreen/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String route = 'splashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) =>
        Provider.of<SplashProvider>(context, listen: false).initMap(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Google Map Polygon',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Created by Ade Putra Prima Suhendri',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
