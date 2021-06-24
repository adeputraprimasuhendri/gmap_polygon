import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GmapProvider extends ChangeNotifier {
  Location location = new Location();
  bool serviceEnabled;
  PermissionStatus permissionStatus;
  LocationData locationData;
  Set<Polygon> polygon = HashSet<Polygon>();
  List<LatLng> polygonLatLng = List<LatLng>();
  int counter = 1;
  initLocation() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
    notifyListeners();
  }

  resetPolygon() async {
    polygon.clear();
    polygonLatLng.clear();
    notifyListeners();
  }

  setPolygon() async {
    counter++;
    polygon.add(
      Polygon(
        polygonId: PolygonId('id-${counter}'),
        points: polygonLatLng,
        strokeWidth: 2,
        strokeColor: Colors.red,
        fillColor: Colors.red.withOpacity(0.15),
      ),
    );
    notifyListeners();
  }
}
