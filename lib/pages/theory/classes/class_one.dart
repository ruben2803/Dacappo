import 'package:flutter/material.dart';

class ClassOne extends StatefulWidget {
  const ClassOne({Key? key}) : super(key: key);

  @override
  State<ClassOne> createState() => _ClassOneState();
}

class _ClassOneState extends State<ClassOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clase 1 - ¿Qué es la Música?'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Clase 1 - ¿Qué es la Música?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Se conoce como música a la combinación ordenada de ritmo, melodía y armonía que resulta agradable a los oídos. Por su carácter inmaterial, la música se considera un arte temporal o del tiempo, al igual que la literatura.',
              ),
              SizedBox(height: 20),
              Text(
                'Ritmo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Se denomina ritmo a todo movimiento regular y recurrente, marcado por una serie de eventos opuestos o diferentes que se suceden en el tiempo. Dicho en otras palabras, el ritmo es un fluir del movimiento de naturaleza visual o sonora, cuyo orden interno puede percibirse e incluso reproducirse.',
              ),
              SizedBox(height: 20),
              Text(
                'Melodía',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sucesión lineal ordenada y coherente de sonidos musicales de diferente altura que forman una unidad estructurada con sentido musical, independiente del acompañamiento.',
              ),
              SizedBox(height: 20),
              Text(
                'Armonía',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'La armonía es aquello que sucede cuando existen dos notas o más que suenen a la vez. Por lo tanto, la armonía hace referencia al arreglo de las notas en un acorde.',
              ),
              SizedBox(width: 50),
            ],
          ),
        ),
      ),
    );
  }
}
