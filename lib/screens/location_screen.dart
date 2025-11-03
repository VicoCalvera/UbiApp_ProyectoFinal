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
      backgroundColor: const Color(0xFFF1F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172B),
        title: const Text(
          "Mi Ubicación",
          style: TextStyle(color: Color(0xFFFEA116)),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFEA116)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Banner decorativo superior
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Tarjeta principal
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(2, 2),
                  )
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.location_on,
                      color: Color(0xFFFEA116), size: 60),
                  const SizedBox(height: 20),
                  Text(
                    _statusMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F172B),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: _getLocation,
                    icon: const Icon(Icons.my_location, color: Colors.white),
                    label: const Text(
                      "Obtener ubicación",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFEA116),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Sección informativa
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Usamos tu ubicación para conectar productores, compradores y transportistas de manera más eficiente. Tu información está protegida.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFF1F8FF),
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
