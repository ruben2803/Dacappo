import 'package:dacappo/pages/examples/exampleNote.dart';
import 'package:dacappo/pages/examples/example_notes_G2.dart';
import 'package:flutter/material.dart';

import '../../examples/example_notes_G1.dart';

class ClassFive extends StatefulWidget {
  const ClassFive({Key? key}) : super(key: key);

  @override
  State<ClassFive> createState() => _ClassFiveState();
}

class _ClassFiveState extends State<ClassFive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clase 5 - ¿Qué es la clave de sol?'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Clase 5 - ¿Qué es la clave de sol?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'La clave de sol es un símbolo musical que se ubica en el pentagrama para representar notas de tonos medios a agudos. Se utiliza para posicionar gráficamente las notas musicales en una determinada altura. Dependiendo de la línea en donde se ubica la clave de sol, se encuentra la nota de sol, y las demás notas musicales se posicionan en las diferentes líneas y espacios del pentagrama.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'La clave de sol en el pentagrama',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'La clave de sol se representa gráficamente en el pentagrama ubicándola sobre la segunda línea de abajo hacia arriba. Su figura tiene una forma redondeada en la parte inferior.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'En la notación anglosajona, las notas musicales se representan con las letras C (do), D (re), E (mi), F (fa), G (sol), A (la) y B (si).',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExampleNotesG2(),
                    ),
                  );
                },
                child: const Icon(Icons.ads_click),
              )
            ],
          ),
        ),
      ),
    );
  }
}
