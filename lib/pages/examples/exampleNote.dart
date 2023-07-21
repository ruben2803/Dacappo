// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ExampleNote extends StatefulWidget {
  const ExampleNote({Key? key}) : super(key: key);

  @override
  State<ExampleNote> createState() => _ExampleNoteState();
}

class _ExampleNoteState extends State<ExampleNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Note'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      'Clave de Sol',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[200],
                        border: Border.all(
                          width: 2,
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/clave_de_sol.png',
                          ),
                          Positioned(
                            top: 80,
                            left: 85,
                            child: IconButton(
                              onPressed: () {
                                playSound(1);
                                debugPrint('Botton de Nota Mi');
                              },
                              icon: const Icon(
                                Icons.music_note,
                                color: Colors.black87,
                                size: 30,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 65,
                            left: 125,
                            child: IconButton(
                              onPressed: () {
                                playSound(2);
                                debugPrint('Botton de Nota Sol');
                              },
                              icon: const Icon(
                                Icons.music_note,
                                color: Colors.black87,
                                size: 30,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 52,
                            left: 165,
                            child: IconButton(
                              onPressed: () {
                                playSound(3);
                                debugPrint('Botton de Nota Si');
                              },
                              icon: const Icon(
                                Icons.music_note,
                                color: Colors.black87,
                                size: 30,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 38,
                            left: 205,
                            child: IconButton(
                              onPressed: () {
                                playSound(4);
                                debugPrint('Botton de Nota Re');
                              },
                              icon: const Icon(
                                Icons.music_note,
                                color: Colors.black87,
                                size: 30,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 24,
                            left: 245,
                            child: IconButton(
                              onPressed: () {
                                playSound(5);
                                debugPrint('Botton de Nota Fa');
                              },
                              icon: const Icon(
                                Icons.music_note,
                                color: Colors.black87,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Explicacion de el ejemplo'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> playSound(int note) async {
    if (note == 1) {
      AudioPlayer().play(AssetSource('sounds/notes/clave_de_sol/mi.mp3'));
    } else if (note == 2) {
      AudioPlayer().play(AssetSource('sounds/notes/clave_de_sol/sol.mp3'));
    } else if (note == 3) {
      AudioPlayer().play(AssetSource('sounds/notes/clave_de_sol/si.mp3'));
    } else if (note == 4) {
      AudioPlayer().play(AssetSource('sounds/notes/clave_de_sol/re.mp3'));
    } else if (note == 5) {
      AudioPlayer().play(AssetSource('sounds/notes/clave_de_sol/fa.mp3'));
    }
  }
}
