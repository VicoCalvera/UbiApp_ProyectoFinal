import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'location_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    final token = await AuthService().getToken();
    setState(() {
      _isAuthenticated = token != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172B),
        title: Row(
          children: const [
            Icon(Icons.agriculture, color: Color(0xFFFEA116)),
            SizedBox(width: 8),
            Text(
              'Ubi App',
              style: TextStyle(
                color: Color(0xFFFEA116),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Cerrar sesión',
            onPressed: () async {
              await AuthService().logout();
              if (!mounted) return;
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: _isAuthenticated
          ? _buildMarketplaceContent()
          : const Center(child: Text('No autenticado')),
    );
  }

  Widget _buildMarketplaceContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Banner con imagen restaurada
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/about-4.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 25),

          // Botón funcional (mantener)
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFEA116),
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            icon: const Icon(Icons.location_on, size: 28, color: Colors.white),
            label: const Text(
              "Ver mi ubicación",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationScreen()),
              );
            },
          ),

          const SizedBox(height: 40),

          // Sección con iconos e información (como en tu HTML)
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildFeatureCard(
                icon: Icons.person,
                title: 'Tipos de usuario',
                text:
                    'Puedes utilizar el usuario de productor para ofrecer y comerciar tus productos o podrás elegir ser un comprador.',
              ),
              _buildFeatureCard(
                icon: Icons.local_shipping,
                title: 'Transporte',
                text:
                    'Una vez realices la elección y compra de los productos podrás contactarte con un servicio de transporte para agilizar la entrega.',
              ),
              _buildFeatureCard(
                icon: Icons.shopping_cart,
                title: 'Pedidos',
                text:
                    'Podrás hacer un seguimiento a tus pedidos por medio de la App.',
              ),
              _buildFeatureCard(
                icon: Icons.headset_mic,
                title: 'Servicio 24/7',
                text:
                    'Tenemos un servicio 24/7 donde te ayudaremos con tus pedidos, compras o ventas.',
              ),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String text,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFFEA116), size: 40),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFFEA116),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
