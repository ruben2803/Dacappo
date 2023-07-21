import 'package:dacappo/models/user.dart';
import 'package:dacappo/pages/user/login_user.dart';
import 'package:dacappo/pages/user/register_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? userId;
  int? userDocumento;
  String? userNombres;
  String? userApellidos;
  String? userTelefono;
  String? userContrasena;
  String? userCorreoElectronico; // Variable para almacenar el ID del usuario

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  void _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('userId');
    String? nombres = prefs.getString('userNombres');
    String? apellidos = prefs.getString('userApellidos');
    int? documento = prefs.getInt('userDocumento');
    String? telefono = prefs.getString('userTelefono');
    String? contrasena = prefs.getString('userContrasena');
    String? correo = prefs.getString('userCorreoElectronico');
    setState(() {
      userId = id;
      userNombres = nombres;
      userApellidos = apellidos;
      userDocumento = documento;
      userTelefono = telefono;
      userContrasena = contrasena;
      userCorreoElectronico = correo;
    });
  }

  void _logout(BuildContext context) async {
    // Restablecer el estado o información del usuario autenticado
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    prefs.remove('userNombres');
    prefs.remove('userApellidos');
    prefs.remove('userDocumento');
    prefs.remove('userTelefono');
    prefs.remove('userContrasena');
    prefs.remove('userCorreoElectronico');

    // Navegar a la pantalla de inicio de sesión
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar'),
        content: const Text('¿Estás seguro de borrar el usuario?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              User().delete(userId!);
              _logout(context);
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _logout(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Usuario:',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$userNombres',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  IconButton(
                    onPressed: () {
                      _showConfirmationDialog(context);
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 17,
                      color: Colors.red.shade400,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddUserPage(
                            userId: userId,
                            userNombres: userNombres,
                            userApellidos: userApellidos,
                            userDocumento: userDocumento,
                            userCorreoElectronico: userCorreoElectronico,
                            userTelefono: userTelefono,
                            userContrasena: userContrasena,
                            update: true,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.update,
                      size: 17,
                      color: Colors.cyan,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
