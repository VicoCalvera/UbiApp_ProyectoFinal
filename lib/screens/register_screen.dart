import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String? _error;
  String? _success;

  Future<void> _register() async {
    if (_formKey.currentState?.validate() != true) return;

    final ok = await _authService.register(
      _usernameController.text,
      _passwordController.text,
    );

    if (ok) {
      setState(() {
        _success = 'Registro exitoso. Ahora puedes iniciar sesión.';
        _error = null;
      });
    } else {
      setState(() {
        _error = 'No se pudo registrar. El usuario puede existir.';
        _success = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF), // 🔵 fondo principal
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
          // 🔷 capa azul oscuro semi transparente
          Container(
            color: const Color(0xCC0F172B),
          ),

          // 🌱 Contenido principal
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
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
                      // 🌾 Encabezado
                      Column(
                        children: const [
                          Icon(Icons.agriculture,
                              size: 90, color: Color(0xFFFEA116)), // 🟠
                          SizedBox(height: 10),
                          Text(
                            'Ubbi App  Registro',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFEA116), // 🟠
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Regístrate y conecta el campo con el mundo 🌱',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF0F172B), // 🔷
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
                              cursorColor: const Color(0xFF0F172B),
                              style: const TextStyle(color: Color(0xFF0F172B)),
                              decoration: InputDecoration(
                                labelText: 'Usuario',
                                labelStyle:
                                    const TextStyle(color: Color(0xFF0F172B)),
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Color(0xFFFEA116), // 🟠
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF1F8FF), // 🔵
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
                                labelText: 'Contraseña',
                                labelStyle:
                                    const TextStyle(color: Color(0xFF0F172B)),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFFFEA116), // 🟠
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF1F8FF), // 🔵
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

                            // 🔷 Botón principal
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _register,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFF0F172B), // 🔷 botón principal
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 4,
                                ),
                                child: const Text(
                                  'Registrarse',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            // 🟠 Enlace
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/login'),
                              child: const Text(
                                '¿Ya tienes cuenta? Inicia sesión',
                                style: TextStyle(
                                  color: Color(0xFFFEA116), // 🟠 enlace
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            // ⚠️ Mensajes
                            if (_error != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  _error!,
                                  style: const TextStyle(color: Colors.redAccent),
                                ),
                              ),
                            if (_success != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Text(
                                  _success!,
                                  style: const TextStyle(
                                    color: Color(0xFF0F172B), // 🔷 éxito
                                    fontWeight: FontWeight.w600,
                                  ),
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
