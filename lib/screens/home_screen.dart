import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/location_service.dart';
//import '../screens/location_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAuthenticated = false;

  // ✅ Variables para guardar la ubicación
  double? _latitude;
  double? _longitude;
  String _locationMessage = "Cargando ubicación...";

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
    _loadLocation(); // ✅ Obtener ubicación al iniciar
  }

  Future<void> _checkAuthentication() async {
    final token = await AuthService().getToken();
    setState(() {
      _isAuthenticated = token != null;
    });
  }

  // ✅ Función para cargar ubicación
  void _loadLocation() async {
    try {
      final position = await LocationService.getLocation();
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
        _locationMessage = "Lat: $_latitude\nLng: $_longitude";
      });
    } catch (e) {
      setState(() {
        _locationMessage = "Error al obtener ubicación";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      appBar: AppBar(
        title: const Text('Ubi App'),
        backgroundColor: const Color(0xFF3A8D3B),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mensaje de bienvenida
          Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.green, size: 28),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  '¡Usuario autenticado exitosamente!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Banner agrícola
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/logo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          const SizedBox(height: 15),

          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const LocationScreen()),
          //     );
          //   },
          //   child: const Text("Ver mi ubicación"),
          // ),

          // ✅ Aquí mostramos ubicación en la app 👇
          Text(
            "📍 Tu ubicación actual:\n$_locationMessage",
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF2E7D32),
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 25),

          // Sección de categorías
          const Text(
            'Categorías destacadas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2E7D32),
            ),
          ),
          const SizedBox(height: 10),
          _buildCategoryGrid(),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid() {
    final categories = [
      {'icon': Icons.eco, 'name': 'Frutas'},
      {'icon': Icons.local_florist, 'name': 'Verduras'},
      {'icon': Icons.agriculture, 'name': 'Granos'},
      {'icon': Icons.set_meal, 'name': 'Cereales'},
      {'icon': Icons.local_grocery_store, 'name': 'Procesados'},
      {'icon': Icons.water_drop, 'name': 'Agua y bebidas'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(2, 2),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(category['icon'] as IconData,
                  size: 35, color: const Color(0xFF388E3C)),
              const SizedBox(height: 8),
              Text(
                category['name'] as String,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      },
    );
  }
}
