import 'package:flutter/material.dart';

class ClassTwo extends StatefulWidget {
  const ClassTwo({Key? key}) : super(key: key);

  @override
  State<ClassTwo> createState() => _ClassTwoState();
}

class _ClassTwoState extends State<ClassTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clase 2 - ¿Qué es una Nota?'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Clase 2 - ¿Qué es una Nota?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Se denomina nota musical al sonido que se produce a través de una vibración cuya frecuencia es constante. Puede decirse, por lo tanto, que una nota es un sonido con una cierta frecuencia.',
              ),
              SizedBox(height: 20),
              Text(
                'En la actualidad, se considera la existencia de siete notas en una escala diatónica (que carece de modificaciones en la tonalidad). Las notas musicales son do, re, mi, fa, sol, la y si, según la notación latina.',
              ),
              SizedBox(height: 20),
              Text(
                'Sucesión lineal ordenada y coherente de sonidos musicales de diferente altura que forman una unidad estructurada con sentido musical, independiente del acompañamiento.',
              ),
              SizedBox(height: 20),
              Text(
                'Esas mismas notas musicales pueden denominarse de otro modo. Para la notación anglosajona, por ejemplo, las notas son C (do), D (re), E (mi), F (fa), G (sol), A (la) y B (si).',
              ),
              SizedBox(width: 50),
            ],
          ),
        ),
      ),
    );
  }
}
