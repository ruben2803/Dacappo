import 'package:dacappo/db/DBHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';
import 'login_user.dart';

// ignore: must_be_immutable
class AddUserPage extends StatefulWidget {
  int? userId;
  String? userNombres;
  String? userApellidos;
  int? userDocumento = 0;
  String? userTelefono;
  String? userCorreoElectronico;
  String? userContrasena;

  bool? update;

  AddUserPage({
    this.userId,
    this.userNombres,
    this.userApellidos,
    this.userDocumento = 0,
    this.userTelefono,
    this.userCorreoElectronico,
    this.userContrasena,
    this.update,
  });

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  late Future<List<User>> userList;

  bool? obscureContrasena = true;
  bool? obscureContrasenaDos = true;

  late TextEditingController editTextNombres;
  late TextEditingController editTextApellidos;
  late TextEditingController editTextDocumento;
  late TextEditingController editTextTelefono;
  late TextEditingController editTextContrasena;
  late TextEditingController editTextContrasenaDos;
  late TextEditingController editTextCorreoElectronico;

  final _formKey = GlobalKey<FormState>();

  String client = "";

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

  @override
  void initState() {
    super.initState();
    editTextNombres = TextEditingController(text: widget.userNombres);
    editTextApellidos = TextEditingController(text: widget.userApellidos);
    editTextDocumento =
        TextEditingController(text: widget.userDocumento.toString());
    editTextTelefono = TextEditingController(text: widget.userTelefono);
    editTextContrasena = TextEditingController(text: widget.userContrasena);
    editTextContrasenaDos = TextEditingController(text: widget.userContrasena);
    editTextCorreoElectronico =
        TextEditingController(text: widget.userCorreoElectronico);
  }

  @override
  Widget build(BuildContext context) {
    String appTitle;
    String textBottom;

    if (widget.update == true) {
      appTitle = "Update usuario";
      textBottom = "Update Client";
    } else {
      appTitle = "Crear usuario";
      textBottom = "Crear Client";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      radius: 50.0,
                      child: Icon(
                        Icons.person,
                        size: 90,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      controller: editTextNombres,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.abc),
                        labelText: 'Nombres',
                        border: OutlineInputBorder(),
                        hintText: 'Digite los nombres del cliente',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter nombres Text";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      controller: editTextApellidos,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.abc),
                        labelText: 'Apellidos',
                        border: OutlineInputBorder(),
                        hintText: 'Digite los apellidos del cliente',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter apellidos Text";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: editTextDocumento,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.numbers),
                        labelText: 'Documento',
                        border: OutlineInputBorder(),
                        hintText: 'Digite el documento del cliente',
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter
                            .digitsOnly // Permite solo dígitos
                      ],
                      onTap: () {
                        if (editTextDocumento.text == '0') {
                          editTextDocumento.clear();
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Documento Text";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      controller: editTextTelefono,
                      decoration: const InputDecoration(
                        labelText: 'Telefono',
                        border: OutlineInputBorder(),
                        hintText: 'Digite el telefono del cliente',
                        icon: Icon(Icons.phone),
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter
                            .digitsOnly // Permite solo dígitos
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter precio Text";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: editTextCorreoElectronico,
                      decoration: const InputDecoration(
                        labelText: 'Correo Electronico',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.mail_outline),
                        hintText: 'Digite el Correo Electronico del cliente',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Correo Electronico Text";
                        }
                        if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: editTextContrasena,
                      obscureText: obscureContrasena!,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.password),
                        labelText: 'Contraseña',
                        border: const OutlineInputBorder(),
                        hintText: 'Digite la Contraseña',
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(obscureContrasena!
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  obscureContrasena = !obscureContrasena!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese una contraseña';
                        }
                        if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>])')
                            .hasMatch(value)) {
                          return 'La contraseña debe contener al menos una letra mayúscula, un número y un carácter especial';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: editTextContrasenaDos,
                      obscureText: obscureContrasenaDos!,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.password),
                        labelText: 'Confirmar Contraseña',
                        border: const OutlineInputBorder(),
                        hintText: 'Confirme la Contraseña',
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(obscureContrasenaDos!
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  obscureContrasenaDos = !obscureContrasenaDos!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese la confirmación de la contraseña';
                        }
                        if (value != editTextContrasena.text) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 400,
                      height: 65,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (widget.update == true) {
                              if (editTextContrasena.text ==
                                  editTextContrasenaDos.text) {
                                User user = User(
                                  id: widget.userId!,
                                  nombres: editTextNombres.text,
                                  apellidos: editTextApellidos.text,
                                  documento: int.parse(editTextDocumento.text),
                                  telefono: editTextTelefono.text,
                                  contrasena: editTextContrasena.text,
                                  correo_electronico:
                                      editTextCorreoElectronico.text,
                                );
                                await user.updateUser();
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          _logout(context);
                                        },
                                        child: Text('Si'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('No'),
                                      ),
                                    ],
                                    title: const Text(
                                        '¿Seguro quiere actualizar los datos?'),
                                    contentPadding: EdgeInsets.all(20.0),
                                    content: const Text(
                                        'La acción actualizará el usuario en la base de datos!'),
                                  ),
                                );
                              }
                            } else {
                              if (editTextContrasena.text ==
                                  editTextContrasenaDos.text) {
                                // Comprobar si el correo electrónico ya existe
                                List<User> existingUsers = await User()
                                    .getUserForEmail(
                                        editTextCorreoElectronico.text);

                                if (existingUsers.isEmpty) {
                                  User client = User(
                                    nombres: editTextNombres.text,
                                    apellidos: editTextApellidos.text,
                                    documento:
                                        int.parse(editTextDocumento.text),
                                    telefono: editTextTelefono.text,
                                    correo_electronico:
                                        editTextCorreoElectronico.text,
                                    contrasena: editTextContrasena.text,
                                  );

                                  await client.saveUser();
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen(),
                                              ),
                                            );
                                          },
                                          child:
                                              const Center(child: Text('ok')),
                                        ),
                                      ],
                                      title: const Text(
                                          'Registro del usuario exitoso'),
                                      contentPadding:
                                          const EdgeInsets.all(20.0),
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child:
                                              const Center(child: Text('ok')),
                                        ),
                                      ],
                                      title: const Text('Error'),
                                      contentPadding:
                                          const EdgeInsets.all(20.0),
                                      content: const Text(
                                          'El correo electrónico ya existe en la base de datos'),
                                    ),
                                  );
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Center(child: Text('ok')),
                                      ),
                                    ],
                                    title: const Text('Error'),
                                    contentPadding: const EdgeInsets.all(20.0),
                                    content: const Text(
                                        'Las contraseñas no son iguales!'),
                                  ),
                                );
                                debugPrint('Las contraseñas no son iguales!');
                              }
                            }
                          }
                        },
                        icon: const Icon(Icons.add),
                        label: Text(textBottom),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
