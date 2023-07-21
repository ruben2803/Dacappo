import 'package:dacappo/db/DBHelper.dart';

import '../db/tables.dart';

// Modelo de User
class User extends DBHelper {
  // Datos de User
  int id;
  String nombres;
  String apellidos;
  int documento;
  String telefono;
  String contrasena;
  String correo_electronico;

  // Constructor de User
  User({
    this.id = 0,
    this.nombres = "",
    this.apellidos = "",
    this.documento = 0,
    this.telefono = "",
    this.contrasena = "",
    this.correo_electronico = "",
  }) : super(userTable);

  @override
  String toString() {
    return "\nid: $id \nnombres: $nombres \napellidos: $apellidos \ndocumento: $documento\ntelefono: $telefono \ncontrasena: $contrasena\ncorreo_electronico: $correo_electronico";
  }

  // Convertir a objeto
  User toObject(Map<dynamic, dynamic> data) {
    return User(
      id: data["id"],
      nombres: data["nombres"],
      apellidos: data["apellidos"],
      documento: data["documento"],
      telefono: data["telefono"],
      contrasena: data["contrasena"],
      correo_electronico: data["correo_electronico"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id > 0 ? id : null,
      "nombres": nombres,
      "apellidos": apellidos,
      "documento": documento,
      "telefono": telefono,
      "contrasena": contrasena,
      "correo_electronico": correo_electronico,
    };
  }

  // Guardar User
  saveUser() async {
    return await (create(toMap()));
  }

  // Actualizar User
  updateUser() async {
    return await (update((toMap())));
  }

  // Remover User
  removeUser() async {
    await delete(id);
  }

  // Obtener Users
  Future<List<User>> getUsers() async {
    var result = await query("SELECT * FROM $userTable");
    return _getListObject(result);
  }

  // Obtener lista en objetos
  List<User> _getListObject(parsed) {
    return (parsed as List).map((map) => toObject(map)).toList();
  }

  Future<User?> login(String correoElectronico, String contrasena) async {
    var result = await query(
        "SELECT * FROM $userTable WHERE correo_electronico = ? AND contrasena = ?",
        arguments: [correoElectronico, contrasena]);
    if (result.isNotEmpty) {
      return toObject(result.first);
    }
    return null;
  }

  Future<List<User>> getUserForEmail(String correoElectronico) async {
    var result = await query(
      "SELECT * FROM $userTable WHERE correo_electronico = ?",
      arguments: [correoElectronico],
    );
    return _getListObject(result);
  }

  Future<User> searchUser() async {
    var result =
        await query("SELECT * FROM $userTable WHERE id=?", arguments: [id]);

    return toObject(result[0]);
  }
}
