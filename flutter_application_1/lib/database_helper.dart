import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'app.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE login (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario TEXT NOT NULL,
        contrasena TEXT NOT NULL
      )
    ''');

    await db.insert('login', {'usuario': 'admin', 'contrasena': '1234'});

    await db.execute('''
      CREATE TABLE ingredientes (
        id_alimento INTEGER PRIMARY KEY,
        nombre_alimento TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE conservacion (
        id_conservacion INTEGER PRIMARY KEY AUTOINCREMENT,
        id_alimento INTEGER,
        metodo_conservacion TEXT,
        descripcion_conservacion TEXT,
        FOREIGN KEY (id_alimento) REFERENCES ingredientes(id_alimento)
      )
    ''');
  }

  Future<bool> validarLogin(String usuario, String contrasena) async {
    final db = await database;
    final res = await db.query(
      'login',
      where: 'usuario = ? AND contrasena = ?',
      whereArgs: [usuario, contrasena],
    );
    return res.isNotEmpty;
  }

  Future<void> insertarRecomendacion(
    int idAlimento,
    String metodo,
    String descripcion,
  ) async {
    final db = await database;
    await db.insert('conservacion', {
      'id_alimento': idAlimento,
      'metodo_conservacion': metodo,
      'descripcion_conservacion': descripcion,
    });
  }

  Future<String?> obtenerDescripcionConservacion(String nombreAlimento) async {
    final db = await database;

    final alimentoRes = await db.query(
      'ingredientes',
      where: 'nombre_alimento = ?',
      whereArgs: [nombreAlimento],
      limit: 1,
    );

    if (alimentoRes.isEmpty) return null;

    final idAlimento = alimentoRes.first['id_alimento'];

    final res = await db.query(
      'conservacion',
      where: 'id_alimento = ?',
      whereArgs: [idAlimento],
      limit: 1,
    );

    if (res.isNotEmpty) {
      return res.first['descripcion_conservacion'] as String;
    }
    return null;
  }

  Future<void> poblarConservacionDePrueba() async {
    final db = await database;

    final alimentos = [
      {'id_alimento': 1, 'nombre_alimento': 'Tomate'},
      {'id_alimento': 2, 'nombre_alimento': 'Papa'},
      {'id_alimento': 3, 'nombre_alimento': 'Pan'},
    ];

    for (var alimento in alimentos) {
      await db.insert(
        'ingredientes',
        alimento,
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }

    await insertarRecomendacion(
      1,
      'Ambiente fresco',
      'El tomate se conserva mejor a temperatura ambiente, lejos del sol.',
    );
    await insertarRecomendacion(
      2,
      'Lugar oscuro',
      'Las papas se deben guardar en un lugar fresco y oscuro, nunca refrigeradas.',
    );
    await insertarRecomendacion(
      3,
      'Bolsa hermética',
      'El pan se debe conservar en una bolsa hermética a temperatura ambiente.',
    );
  }
}
