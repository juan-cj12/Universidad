import 'package:flutter/material.dart';
import 'createAccount.dart';
import 'menuApp.dart';
import 'database_helper.dart';

class Loginf extends StatefulWidget {
  const Loginf({super.key});

  @override
  State<Loginf> createState() => _LoginfState();
}

class _LoginfState extends State<Loginf> {
  late TextEditingController controller;
  late TextEditingController controller2;

  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text(
                  "Inicia sesion en  ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "tu cuenta ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                // Los TextFields o campos de texto
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: "Ingresa tu email",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Colors
                                      .blue, // ✅ Color cuando haces clic o escribes
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),

                      SizedBox(height: 60),
                      Text(
                        "Contraseña",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: controller2,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Ingresa tu contraseña",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Colors
                                      .blue, // ✅ Color cuando haces clic o escribes
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),

                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          final dbHelper = DatabaseHelper();
                          final valido = await dbHelper.validarLogin(
                            email,
                            password,
                          );

                          if (valido) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Sesión iniciada'),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 2),
                              ),
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuApp(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Usuario o contraseña incorrectos',
                                ),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "inicio de sesion",
                          style: TextStyle(color: Colors.white),
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Color de fondo
                          minimumSize: Size(600, 50), // Ancho y alto mínimo
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ), // Bordes redondeados
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ), // Borde con color y grosor
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Text("¿No posees una cuenta?"),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                // Acción al tocar el texto
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CrearCuenta(),
                                  ),
                                );
                              },
                              child: Text(
                                "Crear cuenta",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
