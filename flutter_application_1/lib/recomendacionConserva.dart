import 'package:flutter/material.dart';
import 'database_helper.dart';

class Recomendacionconserva extends StatelessWidget {
  final String alimento;
  const Recomendacionconserva({super.key, required this.alimento});

  Future<String> obtenerRecomendacion() async {
    final dbHelper = DatabaseHelper();
    final resultado = await dbHelper.obtenerDescripcionConservacion(alimento);
    return resultado ?? 'No hay recomendación para este alimento.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendación de conservación'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: obtenerRecomendacion(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(snapshot.data!, style: TextStyle(fontSize: 18)),
              );
            }
          },
        ),
      ),
    );
  }
}
