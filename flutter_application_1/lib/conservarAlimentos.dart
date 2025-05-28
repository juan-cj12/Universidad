import 'package:flutter/material.dart';
import 'recomendacionConserva.dart';
import 'database_helper.dart';
import 'menuApp.dart';

class conservaAlimentos extends StatefulWidget {
  const conservaAlimentos({super.key});

  @override
  State<conservaAlimentos> createState() => _conservaAlimentosState();
}

class _conservaAlimentosState extends State<conservaAlimentos> {
  String alimentoSeleccionado = "";

  @override
  void initState() {
    super.initState();
    DatabaseHelper().poblarConservacionDePrueba();
  }

  Widget botonComida(String alimento) {
    return SizedBox(
      width: 200,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            alimentoSeleccionado = alimento;
          });
        },
        child: Text(alimento, style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              alimentoSeleccionado == alimento
                  ? const Color.fromARGB(255, 56, 147, 221)
                  : Colors.black,
          foregroundColor: Colors.white,
          elevation: 25,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  color: Color.fromARGB(59, 233, 233, 233),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuApp()),
                      );
                    },
                    icon: Image.asset("assets/images/Home.png", height: 40),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color.fromARGB(255, 0, 0, 0),
                    child: Text(
                      "Conserva de alimentos",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
            ),
            alignment: Alignment.center,
            child: Text("Selecciona un alimento"),
          ),
          Container(
            height: 500,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      botonComida("Tomate"),
                      botonComida("Papa"),
                      botonComida("Pan"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              if (alimentoSeleccionado.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Recomendacionconserva(
                          alimento: alimentoSeleccionado,
                        ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selecciona un alimento'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text("Continuar", style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 25,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.black, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
