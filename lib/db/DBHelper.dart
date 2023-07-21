import 'package:dacappo/db/database.dart';
import 'package:sqflite/sqflite.dart';

// Clase que ayuda con las acciones de la base de datos.
abstract class DBHelper {
  // Variable donde se guardará el nombre de la tabla.
  String table;
  DBHelper(this.table);

  // Obtiene la instancia de la base de datos.
  Future<Database> get database async {
    // Imprime la apertura de la base de datos (opcional).
    print(DataBase().open());
    // Retorna la instancia abierta de la base de datos.
    return await DataBase().open();
  }

  // Ejecuta una consulta SQL y retorna los resultados.
  query(String sql, {List<dynamic> arguments = const []}) async {
    return (await database).rawQuery(sql, arguments);
  }

  // Actualiza una fila en la tabla.
  update(Map<String, dynamic> data) async {
    return (await database)
        .update(table, data, where: "id = ?", whereArgs: [data["id"]]);
  }

  // Crea una nueva fila en la tabla.
  create(Map<String, dynamic> data) async {
    return (await database).insert(table, data);
  }

  // Elimina una fila de la tabla por su ID.
  delete(int id) async {
    return (await database).delete(table, where: "id = ?", whereArgs: [id]);
  }
}
