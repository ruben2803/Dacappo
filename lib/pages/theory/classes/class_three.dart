import 'package:flutter/material.dart';

class ClassThree extends StatefulWidget {
  const ClassThree({Key? key}) : super(key: key);

  @override
  State<ClassThree> createState() => _ClassThreeState();
}

class _ClassThreeState extends State<ClassThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clase 3 - ¿Qué son las Claves Musicales?'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Clase 3 - ¿Qué son las Claves Musicales?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'La clave musical se utiliza para especificar la altura de la música que aparece detallada en un pentagrama. Cabe destacar que la altura es una cualidad dependiente de la frecuencia del sonido, que permite diferenciar entre un sonido grave y un sonido agudo.',
              ),
              SizedBox(height: 20),
              Text(
                'A través de la clave musical se asigna una cierta nota a una de las líneas del pentagrama. Dicha nota es tomada como referencia para las notas que aparecerán a continuación. Más allá de que la clave musical se incluye al inicio del pentagrama, se puede cambiar en el transcurso de la composición.',
              ),
              SizedBox(height: 20),
              Text(
                'Sus funciones',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'De la misma manera, la clave musical también se encarga de llevar a cabo otras funciones como son las siguientes:',
              ),
              SizedBox(height: 10),
              Text(
                '- Diferenciar el nombre de las notas con respecto a los diferentes espacios e incluso a las líneas que dan forma al pentagrama.',
              ),
              Text(
                '- Indicar al instrumento musical al que va dirigido ese pentagrama. Muchas claves están asociadas a un instrumento en concreto.',
              ),
              Text(
                '- Asociar las figuras del pentagrama con la nota en sí.',
              ),
              SizedBox(height: 20),
              Text(
                'Tipos de claves',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Actualmente se usan tres clases de claves musicales: la clave de do, la clave de fa y la clave de sol. Los signos de las tres claves derivan de las letras que se usaban en la notación original: C (do), F (fa) y G (sol).',
              ),
              SizedBox(height: 10),
              Text(
                'La clave de do también recibe el nombre de clave de alto. Se emplea para registrar sonidos medios y puede ser de varios tipos, destacando la clave de do en cuarta línea o la clave de do en tercera línea.',
              ),
              Text(
                'La clave de fa, según la posición, puede ser en cuarta línea o en tercera línea.',
              ),
              Text(
                'La clave de sol también se da en llamar clave de soprano.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
