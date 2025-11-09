import 'package:flutter/material.dart';

class ProductorScreen extends StatelessWidget {
  const ProductorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172B),
        title: const Text(
          'Productor',
          style: TextStyle(
            color: Color(0xFFFEA116),
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w900,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFEA116)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Título tipo Dream Team
            const Text(
              'Unete a Ubi App',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Pacifico',
                color: Color(0xFF0F172B),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Imagen de Transportista
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                image: const DecorationImage(
                  image: AssetImage('assets/images/productor.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Nombre del integrante
            const Text(
              '¿Que puedes hacer como Productor en UbiApp?',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172B),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            // Descripción
            const Text(
              'Como productor en Ubbi App, puedes vender tus productos agrícolas de manera directa, sin intermediarios, obteniendo un mejor precio por tu trabajo y asegurando que tus cosechas lleguen a más consumidores. Nuestra plataforma te permite conectar fácilmente con compradores interesados en productos frescos y de calidad, además de coordinar el transporte de tus ventas con transportistas disponibles. De esta manera, puedes ampliar tu mercado, aumentar tus ganancias y fortalecer el comercio justo.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Nunito',
                color: Color(0xFF0F172B),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Pie de página dentro del scroll
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF0F172B),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.location_on, color: Color(0xFFFEA116)),
                      SizedBox(width: 8),
                      Text(
                        'Universidad San Buenaventura',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunita',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.phone, color: Color(0xFFFEA116)),
                      SizedBox(width: 8),
                      Text(
                        '+57 3213535001',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunita',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.email, color: Color(0xFFFEA116)),
                      SizedBox(width: 8),
                      Text(
                        'info@ubiapp.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunita',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
