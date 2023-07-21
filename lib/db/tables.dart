const String userTable = "users";

// Clase que creará las tablas de la base de datos.
List get tables => [
      // Query para crear tablas.

      _createTable(
          userTable,
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
          "nombres TEXT,"
          "apellidos TEXT,"
          "documento INTEGER,"
          "telefono TEXT,"
          "correo_electronico TEXT,"
          "contrasena TEXT"),
    ];

// Recibe la lista anterior con los parámetros de las tablas y crea las tablas en la base de datos.
_createTable(String table, String columns) {
  // Imprime el query para crear la tabla (opcional).
  //print("CREATE TABLE IF NOT EXISTS $table($columns)");
  // Retorna el query para crear la tabla.
  return "CREATE TABLE IF NOT EXISTS $table($columns)";
}
