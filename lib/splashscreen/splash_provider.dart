import 'package:flutter/cupertino.dart';
import 'package:gmap/gmap/gmap_screen.dart';

class SplashProvider extends ChangeNotifier {
  initMap(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      GmapScreen.route,
      (route) => false,
    );
  }
}
