import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  const MapScreen({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    final LatLng position = LatLng(latitude, longitude);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172B),
        title: const Text("Mapa", style: TextStyle(color: Color(0xFFFEA116))),
        iconTheme: const IconThemeData(color: Color(0xFFFEA116)),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: position,
          zoom: 13,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("current"),
            position: position,
            infoWindow: const InfoWindow(title: "Tu ubicación"),
          ),
        },
      ),
    );
  }
}
