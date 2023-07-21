import 'package:dacappo/db/tables.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Se crea la clase DataBase que creará la base de datos.
class DataBase {
  // Nombre de la base de datos.
  String name = "dacappo";
  // Versión de la base de datos.
  int version = 1;

  // Abre la base de datos.
  Future<Database> open() async {
    // Obtiene el directorio de la base de datos en el dispositivo.
    String path = join(await getDatabasesPath(), name);
    // Abre la base de datos en la ubicación especificada.
    return openDatabase(
      path,
      version: version,
      onConfigure: onConfigure,
      onCreate: onCreate,
    );
  }

  // Crea la base de datos.
  onCreate(Database db, int version) async {
    // Ejecuta cada script de creación de tabla en la base de datos.
    for (var script in tables) {
      await db.execute(script);
    }
  }

  // Configuración para activar las claves foráneas en la base de datos.
  onConfigure(Database db) async {
    // Ejecuta una consulta PRAGMA para activar las claves foráneas.
    await db.execute("PRAGMA foreign_keys = ON");
  }
}
