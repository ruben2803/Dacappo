import 'package:dacappo/models/exercise.dart';
import 'package:dacappo/pages/exercises/exercises/exercise_fourt.dart';
import 'package:dacappo/pages/exercises/exercises/exercise_one.dart';
import 'package:dacappo/pages/exercises/exercises/exercise_prueba.dart';
import 'package:dacappo/pages/exercises/exercises/exercise_three.dart';
import 'package:dacappo/pages/exercises/exercises/exercise_two.dart';

import 'package:flutter/material.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({Key? key}) : super(key: key);

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  List<Exercise> exercise = [
    const Exercise(
      exerciseId: 1,
      exerciseName: 'Clave de Sol/g: Lineas( Mi/E-Sol/G-Si/B-Re/D-Fa/F )',
    ),
    const Exercise(
      exerciseId: 2,
      exerciseName: 'Clave de Sol/G: Espacios( Fa/F-La/A-Do/C/Do-Mi-E )',
    ),
    const Exercise(
      exerciseId: 3,
      exerciseName: 'Clave de Fa/F: Espacios( Sol-G/Si-B/Re-D/Fa-F/La-A )',
    ),
    const Exercise(
      exerciseId: 4,
      exerciseName: 'Clave de Fa/F: Espacios( La-A/Do-C/Mi-E/Sol-G-Si/B )',
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
                itemCount: 4,
                itemBuilder: (context, index) {
                  final theory = exercise[index];
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
                          title: Text('Ejercicios:${theory.exerciseId}'),
                          subtitle: Text('Ejercicio#: ${theory.exerciseName}'),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            if (theory.exerciseId == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ExerciseOne(),
                                ),
                              );
                            } else if (theory.exerciseId == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ExerciseTwo(),
                                ),
                              );
                            } else if (theory.exerciseId == 3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ExerciseThree(),
                                ),
                              );
                            } else if (theory.exerciseId == 4) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ExerciseFourt(),
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
