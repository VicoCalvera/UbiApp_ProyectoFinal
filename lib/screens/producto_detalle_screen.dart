import 'package:flutter/material.dart';

class ProductoDetalleScreen extends StatelessWidget {
  final Map<String, String> producto;

  const ProductoDetalleScreen({
    Key? key,
    required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172B),
        iconTheme: const IconThemeData(color: Color(0xFFFEA116)),
        title: Text(
          producto['nombre']!,
          style: const TextStyle(
            color: Color(0xFFFEA116),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagen del producto
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: producto['imagen']!.contains('assets')
                  ? Image.asset(
                      producto['imagen']!,
                      height: 240,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      producto['imagen']!,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
            ),

            const SizedBox(height: 20),

            // Información Principal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto['nombre']!,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    producto['precio']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFEA116),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 20, color: Color(0xFF0F172B)),
                      const SizedBox(width: 6),
                      Text(
                        producto['ubicacion']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0F172B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Descripción ejemplo (porque aún no hay BD)
                  const Text(
                    'Descripción del producto:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Producto fresco directamente del productor local. '
                    'Ideal para venta al por mayor o menor. Calidad garantizada.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF0F172B),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Botón Comprar / Contactar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEA116),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Contactar Productor",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172B),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
