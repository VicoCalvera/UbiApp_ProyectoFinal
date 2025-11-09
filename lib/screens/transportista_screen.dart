import 'package:flutter/material.dart';

class TransportistaScreen extends StatelessWidget {
  const TransportistaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172B),
        title: const Text(
          'Transportista',
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
                  image: AssetImage('assets/images/estacas.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Nombre del integrante
            const Text(
              '¿Que puedes hacer como Transportista?',
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
              'Como transportista en Ubbi App, tienes la oportunidad de conectar con productores y consumidores que necesitan trasladar sus productos de manera rápida y eficiente. A través de nuestra plataforma, podrás recibir solicitudes de envío, establecer acuerdos directamente con los clientes y optimizar tus rutas para maximizar tus ganancias. Al formar parte de nuestra comunidad, te aseguras de contar con más oportunidades de trabajo y una red de usuarios que valoran un servicio confiable y seguro.',
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
