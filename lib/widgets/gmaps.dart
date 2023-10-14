import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMaps extends StatelessWidget {
  const GMaps({super.key, required this.lat, required this.lang});
  final double lat;
  final double lang;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const GoogleMap(
          zoomControlsEnabled: false,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          padding: EdgeInsets.only(top: 400, right: 10),
          initialCameraPosition: CameraPosition(
            target: LatLng(10, 10),
            zoom: 10,
          )),
    );
  }
}
