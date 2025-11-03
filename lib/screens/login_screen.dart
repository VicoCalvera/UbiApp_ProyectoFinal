import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '../services/auth_service.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final LocalAuthentication _localAuth = LocalAuthentication();
  String? _error;

  Future<void> _login() async {
    if (_formKey.currentState?.validate() != true) return;

    final token = await _authService.login(
      _usernameController.text,
      _passwordController.text,
    );

    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      setState(() {
        _error = "Intento errado";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF), // 🔵 Fondo principal
      body: Stack(
        children: [
          // 🖼️ Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/farm_login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 🔷 Capa azul oscura con opacidad suave
          Container(
            color: const Color(0xCC0F172B), // Transparencia del banner principal
          ),

          // 🌱 Contenido principal
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 🌾 Logo y encabezado
                      Column(
                        children: const [
                          Icon(Icons.agriculture, size: 90, color: Color(0xFFFEA116)), // 🟠
                          SizedBox(height: 10),
                          Text(
                            'Ubbi App  Ingreso',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFEA116), // 🟠 título
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Conecta el campo con el mundo entero 🌱',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF0F172B), // 🔷 subtítulo
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // 🧾 Formulario
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              cursorColor: const Color(0xFF0F172B), // Color del cursor
                              style: const TextStyle(color: Color(0xFF0F172B)), // Color del texto escrito
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Color(0xFFFEA116),
                                ),
                                labelText: 'Usuario',
                                labelStyle: const TextStyle(color: Color(0xFF0F172B)),
                                filled: true,
                                fillColor: const Color(0xFFF1F8FF),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Color(0xFF0F172B)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Color(0xFF0F172B), width: 2),
                                ),
                              ),
                              validator: (v) =>
                                  v == null || v.isEmpty ? 'Campo requerido' : null,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              cursorColor: const Color(0xFF0F172B),
                              style: const TextStyle(color: Color(0xFF0F172B)),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFFFEA116),
                                ),
                                labelText: 'Contraseña',
                                labelStyle: const TextStyle(color: Color(0xFF0F172B)),
                                filled: true,
                                fillColor: const Color(0xFFF1F8FF),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Color(0xFF0F172B)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Color(0xFF0F172B), width: 2),
                                ),
                              ),
                              validator: (v) =>
                                  v == null || v.isEmpty ? 'Campo requerido' : null,
                            ),
                            const SizedBox(height: 30),

                            // 🔷 Botón de inicio de sesión
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0F172B), // 🔷 principal
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 4,
                                ),
                                onPressed: _login,
                                child: const Text(
                                  'Iniciar sesión',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            // 🟠 Enlace de registro
                            TextButton(
                              onPressed: () => Navigator.pushNamed(context, '/register'),
                              child: const Text(
                                '¿No tienes cuenta? Regístrate',
                                style: TextStyle(
                                  color: Color(0xFFFEA116),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            // ⚠️ Error
                            if (_error != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  _error!,
                                  style: const TextStyle(color: Colors.redAccent),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
