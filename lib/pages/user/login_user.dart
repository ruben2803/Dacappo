import 'package:dacappo/navbar/bar_navigation.dart';
import 'package:dacappo/pages/home_page.dart';
import 'package:dacappo/pages/user/register_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController correoController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();

  bool? checkGuardarDatos = false;
  bool? obscureContrasena = true;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      String correoElectronico = correoController.text;
      String contrasena = contrasenaController.text;

      User? user = await User().login(correoElectronico, contrasena);
      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('userId', user.id);
        prefs.setString('userNombres', user.nombres);
        prefs.setString('userApellidos', user.apellidos);
        prefs.setInt('userDocumento', user.documento);
        prefs.setString('userTelefono', user.telefono);
        prefs.setString('userContrasena', user.contrasena);
        prefs.setString('userCorreoElectronico', user.correo_electronico);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NavBar(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text(
                'El correo electrónico y/o la contraseña son incorrectos o no existen'),
            contentPadding: EdgeInsets.all(20.0),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  void _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      checkGuardarDatos = prefs.getBool('checkGuardarDatos') ?? false;
      if (checkGuardarDatos!) {
        correoController.text = prefs.getString('userCorreoElectronico') ?? '';
        contrasenaController.text = prefs.getString('userContrasena') ?? '';
      }
    });
  }

  void _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('checkGuardarDatos', checkGuardarDatos!);
    if (checkGuardarDatos!) {
      await prefs.setString('userCorreoElectronico', correoController.text);
      await prefs.setString('userContrasena', contrasenaController.text);
    } else {
      await prefs.remove('userCorreoElectronico');
      await prefs.remove('userContrasena');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: correoController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Correo Electrónico',
                          border: OutlineInputBorder(),
                          hintText: 'Digite el Correo Electrónico',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Correo Electrónico Text";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: contrasenaController,
                        obscureText: obscureContrasena!,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.password),
                          labelText: 'Contraseña',
                          border: const OutlineInputBorder(),
                          hintText: 'Digite la Contraseña',
                          suffixIcon: IconButton(
                            icon: Icon(obscureContrasena!
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                obscureContrasena = !obscureContrasena!;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Contraseña Text";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      OutlinedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 60),
                          ), // Ajusta el ancho y alto mínimo
                        ),
                        child: const Text('Login'),
                        onPressed: _login,
                      ),
                      const SizedBox(height: 10),
                      CheckboxListTile(
                        value: checkGuardarDatos,
                        title: const Text('Guardar las credenciales'),
                        onChanged: (value) {
                          setState(() {
                            checkGuardarDatos = value;
                          });
                        },
                        secondary: const Icon(Icons.safety_check),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('¿No tienes cuenta?'),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.blue,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddUserPage(),
                                  ),
                                );
                              },
                              child: const Text('Regístrate aquí!'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _saveCredentials();
    super.dispose();
  }
}
