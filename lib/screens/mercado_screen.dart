import 'package:flutter/material.dart';

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
            const SizedBox(height: 25),

            const Text(
              '¡Explora todos los productos frescos que tenemos para tí!',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172B),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 18),

            // Marketplace Grid
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
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 6,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                          child: Image.asset(
                            producto['imagen']!,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto['nombre']!,
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF0F172B),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                producto['precio']!,
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 14,
                                  color: Color(0xFFFEA116),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on, size: 14, color: Color(0xFF0F172B)),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      producto['ubicacion']!,
                                      style: const TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 13,
                                        color: Color(0xFF0F172B),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            // Pie de página
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF0F172B),
              ),
              child: Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: Color(0xFFFEA116)),
                      SizedBox(width: 8),
                      Text('Universidad San Buenaventura',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Color(0xFFFEA116)),
                      SizedBox(width: 8),
                      Text('+57 3213535001',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, color: Color(0xFFFEA116)),
                      SizedBox(width: 8),
                      Text('info@ubiapp.com',
                          style: TextStyle(color: Colors.white)),
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
