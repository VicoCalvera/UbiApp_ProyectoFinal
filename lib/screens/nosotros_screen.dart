import 'package:flutter/material.dart';

class NosotrosScreen extends StatelessWidget {
  const NosotrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172B),
        title: const Text(
          'Nosotros',
          style: TextStyle(color: Color(0xFFFEA116),
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w900,)
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFEA116)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Título Dream Team
            const Text(
              'Dream Team',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172B),
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildMember(
                    imagePath: 'assets/images/Img.png',
                    name: 'Victor Calvera',
                    description: 'Sexto Semestre / Desarrollo de Software',
                  ),
                  const SizedBox(height: 20),
                  _buildMember(
                    imagePath: 'assets/images/Img.png',
                    name: 'Jonathan Estupiñan',
                    description: 'Sexto Semestre / Desarrollo de Software',
                  ),
                  const SizedBox(height: 20),
                  _buildMember(
                    imagePath: 'assets/images/halo2.jpg',
                    name: 'Julio Jaramillo',
                    description: 'Retirado / Desarrollo de Software',
                  ),
                  const SizedBox(height: 20),
                  _buildMember(
                    imagePath: 'assets/images/Img.png',
                    name: 'Cristian Chitiva',
                    description: 'Sexto Semestre / Desarrollo de Software',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Pie de página / banner inferior
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF0F172B),
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(10),
                //   topRight: Radius.circular(10),
                // ),
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
                        style: TextStyle(color: Colors.white),
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
                        style: TextStyle(color: Colors.white),
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
                        style: TextStyle(color: Colors.white),
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

  Widget _buildMember({
    required String imagePath,
    required String name,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF0F172B),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
