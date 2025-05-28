import 'package:flutter/material.dart';
import 'menuApp.dart';
import 'database_helper.dart';

class PlanAlimentos extends StatefulWidget {
  const PlanAlimentos({super.key});

  @override
  State<PlanAlimentos> createState() => _PlanAlimentosState();
}

String alimentoSeleccionado = "";

class _PlanAlimentosState extends State<PlanAlimentos> {
  final DatabaseHelper dbHelper = DatabaseHelper();

  // Método para buscar recetas relacionadas al grupo alimenticio seleccionado
  Future<void> buscarRecetasPorGrupo(String grupo) async {
    final db = await dbHelper.database;

    // Obtener alimentos del grupo seleccionado
    final alimentos = await db.query(
      'ingredientes',
      where: 'grupo_alimenticio = ?',
      whereArgs: [grupo],
    );

    List<int> idAlimentos =
        alimentos.map((a) => a['id_alimento'] as int).toList();

    if (idAlimentos.isEmpty) {
      _mostrarDialogo("No hay alimentos registrados para este grupo.");
      return;
    }

    // Buscar recetas que usen esos alimentos
    final recetas = await db.rawQuery('''
      SELECT DISTINCT r.nombre_receta, r.descripcion
      FROM recetas r
      INNER JOIN receta_alimentos ra ON r.id_receta = ra.id_receta
      WHERE ra.id_alimento IN (${idAlimentos.join(',')})
    ''');

    if (recetas.isEmpty) {
      _mostrarDialogo("No se encontraron recetas para el grupo $grupo.");
    } else {
      _mostrarDialogo(
        "Recetas encontradas:",
        recetas
            .map((r) => "${r['nombre_receta']}:\n${r['descripcion']}")
            .join("\n\n"),
      );
    }
  }

  // Mostrar diálogo con resultados
  void _mostrarDialogo(String titulo, [String contenido = ""]) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(titulo),
            content: Text(contenido.isEmpty ? titulo : contenido),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cerrar"),
              ),
            ],
          ),
    );
  }

  Widget botonComida(String grupo) {
    return SizedBox(
      width: 200,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            alimentoSeleccionado = grupo;
          });
        },
        child: Text(grupo, style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              alimentoSeleccionado == grupo
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
                    color: Colors.black,
                    child: Text(
                      "Plan de alimentos",
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
            child: Text("Selecciona un tipo de alimento para obtener recetas"),
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
                      botonComida("Producto lacteo"),
                      SizedBox(height: 10),
                      botonComida("Proteina"),
                      SizedBox(height: 10),
                      botonComida("Grano"),
                      SizedBox(height: 10),
                      botonComida("Fruta"),
                      SizedBox(height: 10),
                      botonComida("Verdura"),
                      SizedBox(height: 10),
                      botonComida("Aceites grasas"),
                      SizedBox(height: 10),
                      botonComida("Alcohol"),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              if (alimentoSeleccionado.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selecciona un grupo alimenticio'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                buscarRecetasPorGrupo(alimentoSeleccionado);
              }
            },
            child: Text("Continuar", style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 25,
              shadowColor: Colors.black,
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
