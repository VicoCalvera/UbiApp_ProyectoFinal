import 'package:flutter/material.dart';
import '../services/location_service.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double? _latitude;
  double? _longitude;
  String _statusMessage = "Presiona el botón para obtener ubicación";

  void _getLocation() async {
    setState(() {
      _statusMessage = "Cargando ubicación...";
    });

    try {
      final position = await LocationService.getLocation();
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
        _statusMessage = "Latitud: $_latitude\nLongitud: $_longitude";
      });
    } catch (e) {
      setState(() {
        _statusMessage = "Error al obtener ubicación";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Ubicación"),
        backgroundColor: const Color(0xFF3A8D3B),
      ),
      backgroundColor: const Color(0xFFF4F8F2),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _statusMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _getLocation,
              icon: const Icon(Icons.my_location),
              label: const Text("Obtener ubicación"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3A8D3B),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
