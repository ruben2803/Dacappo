import 'package:dacappo/models/exercise.dart';
import 'package:dacappo/pages/exercises/exercises/exercise_one.dart';
import 'package:dacappo/pages/exercises/exercises/exercise_prueba.dart';
import 'package:dacappo/pages/exercises/exercises/exercise_two.dart';
import 'package:dacappo/pages/theory/classes/class_fourt.dart';
import 'package:dacappo/pages/theory/classes/class_one.dart';
import 'package:dacappo/pages/theory/classes/class_seven.dart';
import 'package:dacappo/pages/theory/classes/class_six.dart';
import 'package:dacappo/pages/theory/classes/class_three.dart';
import 'package:dacappo/pages/theory/classes/class_two.dart';

import 'package:flutter/material.dart';

import '../../models/theory.dart';
import 'classes/class_five.dart';

class TheoryPage extends StatefulWidget {
  const TheoryPage({Key? key}) : super(key: key);

  @override
  State<TheoryPage> createState() => _TheoryPageState();
}

class _TheoryPageState extends State<TheoryPage> {
  List<Theory> theories = [
    const Theory(
      theoryId: 1,
      theoryName: '¿Que es la musica?',
    ),
    const Theory(
      theoryId: 2,
      theoryName: '¿Que es una Nota?',
    ),
    const Theory(
      theoryId: 3,
      theoryName: '¿Que son las Claves Musicales?',
    ),
    const Theory(
      theoryId: 4,
      theoryName: 'Clave de Sol/G - Lineas',
    ),
    const Theory(
      theoryId: 5,
      theoryName: 'Clave de Sol/G - Espacios',
    ),
    const Theory(
      theoryId: 6,
      theoryName: 'Clave de Fa/F - Lineas',
    ),
    const Theory(
      theoryId: 7,
      theoryName: 'Clave de Fa/F - Espacios',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Exercise Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Ejercicios Musicales',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  final theory = theories[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[200],
                        border: Border.all(
                          width: 0.1,
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text('Clase:${theory.theoryId}'),
                          subtitle: Text('subtitle: ${theory.theoryName}'),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            if (theory.theoryId == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ClassOne(),
                                ),
                              );
                            } else if (theory.theoryId == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ClassTwo(),
                                ),
                              );
                            } else if (theory.theoryId == 3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ClassThree(),
                                ),
                              );
                            } else if (theory.theoryId == 4) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ClassFourt(),
                                ),
                              );
                            } else if (theory.theoryId == 5) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ClassFive(),
                                ),
                              );
                            } else if (theory.theoryId == 6) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ClassSixe(),
                                ),
                              );
                            } else if (theory.theoryId == 7) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ClassSeven(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
