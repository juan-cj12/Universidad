import 'package:flutter/material.dart';
import 'database_helper.dart'; // Importa tu helper

class CrearCuenta extends StatefulWidget {
  const CrearCuenta({super.key});

  @override
  State<CrearCuenta> createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _repassController = TextEditingController();

  Future<void> _registrarUsuario() async {
    String email = _emailController.text.trim();
    String pass = _passController.text;
    String repass = _repassController.text;

    if (email.isEmpty || pass.isEmpty || repass.isEmpty) {
      _showMessage("Todos los campos son obligatorios", Colors.red);
      return;
    }

    if (pass != repass) {
      _showMessage("Las contraseñas no coinciden", Colors.red);
      return;
    }

    try {
      final db = await DatabaseHelper().database;
      await db.insert('usuario', {'correo': email, 'contrasena': pass});

      _showMessage("Cuenta creada exitosamente", Colors.green);

      Navigator.pop(context); // Regresa al login
    } catch (e) {
      _showMessage("Error: el correo ya está registrado", Colors.red);
    }
  }

  void _showMessage(String mensaje, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: color,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 58, top: 100, right: 50),
            child: Text("Crear una cuenta", style: TextStyle(fontSize: 30)),
          ),
          Image.asset("assets/images/comida.png"),
          SizedBox(height: 10),

          // EMAIL
          Padding(
            padding: const EdgeInsets.only(right: 290),
            child: Text("Email"),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Ingresa tu email",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
          ),

          // CONTRASEÑA
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 270),
            child: Text("Contraseña"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _passController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Ingresa tu contraseña",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
          ),

          // REPETIR CONTRASEÑA
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 220),
            child: Text("Repetir contraseña"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _repassController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Repite tu contraseña",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Al registrarse en esta aplicación, también está aceptando nuestros términos de servicio y política de privacidad",
              textAlign: TextAlign.center,
            ),
          ),

          // BOTÓN REGISTRAR
          ElevatedButton(
            onPressed: _registrarUsuario,
            child: Text("Crear cuenta", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(600, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.black, width: 2),
              ),
            ),
          ),
          SizedBox(height: 10),

          // ¿YA TIENES CUENTA?
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20, bottom: 20),
            child: Row(
              children: [
                Text("¿Ya tienes una cuenta?"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "Iniciar sesión",
                    style: TextStyle(decoration: TextDecoration.underline),
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
