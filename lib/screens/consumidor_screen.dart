import 'package:flutter/material.dart';

class ConsumidorScreen extends StatelessWidget {
  const ConsumidorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172B),
        title: const Text(
          'Consumidor',
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
                  image: AssetImage('assets/images/consumidor.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Nombre del integrante
            const Text(
              '¿Que puedes hacer en UbiApp?',
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
              'Como consumidor en Ubi App, tienes la oportunidad de comprar directamente a los productores sin intermediarios, garantizando productos frescos, de calidad y a precios justos. A través de nuestra plataforma, podrás explorar una amplia variedad de productos agrícolas, elegir los que necesitas y coordinar la entrega con transportistas de confianza para recibirlos en la puerta de tu casa o negocio. Además, al comprar directamente, apoyas a los productores locales y fomentas un comercio más justo y sostenible. Todo esto de manera rápida, segura y sin complicaciones.',
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
