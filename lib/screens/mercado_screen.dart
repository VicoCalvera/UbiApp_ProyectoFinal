import 'package:flutter/material.dart';
import 'producto_detalle_screen.dart';

class MercadoScreen extends StatelessWidget {
  const MercadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de productos ficticios
    final List<Map<String, String>> productos = [
           {
        'nombre': 'Papa Pastusa',
        'precio': '\$1.200 / Kg',
        'ubicacion': 'Nariño',
        'imagen': 'assets/images/papapastusa.jpg'
      },
      {
        'nombre': 'Tomate Chonto',
        'precio': '\$2.000 / Kg',
        'ubicacion': 'Boyacá',
        'imagen': 'assets/images/tomate.png'
      },
      {
        'nombre': 'Plátano Verde',
        'precio': '\$1.600 / Kg',
        'ubicacion': 'Chocó',
        'imagen': 'assets/images/platano_verde.jpeg'
      },
      {
        'nombre': 'Aguacate Hass',
        'precio': '\$3.200 / Kg',
        'ubicacion': 'Tolima',
        'imagen': 'assets/images/aguacate.png'
      },
      {
        'nombre': 'Cebolla Cabezona',
        'precio': '\$1.500 / Kg',
        'ubicacion': 'Santander',
        'imagen': 'assets/images/cebolla_cab.jpg'
      },
      {
        'nombre': 'Mango Tommy',
        'precio': '\$2.300 / Kg',
        'ubicacion': 'Valle del Cauca',
        'imagen': 'assets/images/mango.jpg'
      },
      {
        'nombre': 'Lechuga Batavia',
        'precio': '\$1.000 / Unidad',
        'ubicacion': 'Cundinamarca',
        'imagen': 'assets/images/lechuga.jpg'
      },
      {
        'nombre': 'Banano',
        'precio': '\$1.200 / Kg',
        'ubicacion': 'Antioquia',
        'imagen': 'assets/images/banano.jpg'
      },
      {
        'nombre': 'Café Excelso',
        'precio': '\$18.000 / Libra',
        'ubicacion': 'Huila',
        'imagen': 'assets/images/coffee.jpg'
      },
      {
        'nombre': 'Maíz Amarillo',
        'precio': '\$900 / Kg',
        'ubicacion': 'Córdoba',
        'imagen': 'assets/images/maiz.jpg'
      },
      {
        'nombre': 'Cacao en Grano',
        'precio': '\$21.000 / Kg',
        'ubicacion': 'Cauca',
        'imagen': 'assets/images/cacao.jpeg'
      },
      {
        'nombre': 'Yuca',
        'precio': '\$1.000 / Kg',
        'ubicacion': 'Meta',
        'imagen': 'assets/images/yuca.jpg'
      },
      {
        'nombre': 'Naranja Valencia',
        'precio': '\$1.200 / Kg',
        'ubicacion': 'Atlántico',
        'imagen': 'assets/images/naranja.jpg'
      },
      {
        'nombre': 'Piña Oro Miel',
        'precio': '\$2.400 / Unidad',
        'ubicacion': 'Quindío',
        'imagen': 'assets/images/papacriolla.jpg'
      },
      {
        'nombre': 'Arroz Paddy',
        'precio': '\$2.100 / Kg',
        'ubicacion': 'Sucre',
        'imagen': 'assets/images/arroz.jpg'
      },
      {
        'nombre': 'Frijol Bola Roja',
        'precio': '\$4.200 / Kg',
        'ubicacion': 'Norte de Santander',
        'imagen': 'assets/images/frijol.jpg'
      },
      {
        'nombre': 'Papa Criolla',
        'precio': '\$2.800 / Kg',
        'ubicacion': 'Caldas',
        'imagen': 'assets/images/papacriolla.jpg'
      },
      {
        'nombre': 'Cilantro',
        'precio': '\$500 / Manojo',
        'ubicacion': 'Risaralda',
        'imagen': 'assets/images/cilantro.jpg'
      },
      {
        'nombre': 'Lulo',
        'precio': '\$3.000 / Kg',
        'ubicacion': 'Putumayo',
        'imagen': 'assets/images/lulo.jpg'
      },
      {
        'nombre': 'Guayaba',
        'precio': '\$2.700 / Kg',
        'ubicacion': 'Casanare',
        'imagen': 'assets/images/guayaba.jpg'
      },
    ];
    
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172B),
        title: const Text(
          'Mercado',
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
          children: [
            const SizedBox(height: 20),
            const Text(
              'Productos frescos directamente del productor',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172B),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // GRID DE PRODUCTOS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductoDetalleScreen(producto: producto),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 5,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              producto['imagen']!,
                              height: 115,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  producto['nombre']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito',
                                    color: Color(0xFF0F172B),
                                  ),
                                ),
                                Text(
                                  producto['precio']!,
                                  style: const TextStyle(
                                    color: Color(0xFFFEA116),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 14, color: Color(0xFF0F172B)),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        producto['ubicacion']!,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Nunito',
                                          color: Color(0xFF0F172B),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
