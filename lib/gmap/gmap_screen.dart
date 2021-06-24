import 'package:flutter/material.dart';
import 'package:gmap/gmap/gmap_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GmapScreen extends StatefulWidget {
  static const String route = 'gmapScreen';
  @override
  _GmapScreenState createState() => _GmapScreenState();
}

class _GmapScreenState extends State<GmapScreen> {
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((value) =>
        Provider.of<GmapProvider>(context, listen: false).initLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<GmapProvider>(builder: (context, provider, _) {
          if (provider.locationData == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                provider.locationData.latitude,
                provider.locationData.longitude,
              ),
              zoom: 16,
            ),
            mapType: MapType.hybrid,
            polygons: provider.polygon,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            onTap: (point) {
              provider.polygonLatLng.add(point);
              provider.setPolygon();
            },
          );
        }),
      ),
      floatingActionButton:
          Consumer<GmapProvider>(builder: (context, provider, _) {
        return FloatingActionButton.extended(
          onPressed: () {
            provider.resetPolygon();
          },
          label: Text('Clear Map'),
          icon: Icon(Icons.refresh),
          backgroundColor: Colors.white,
        );
      }),
    );
  }
}
