// ignore_for_file: file_names

import 'package:dacappo/navbar/bar_navigation.dart';
import 'package:dacappo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ExampleNotesF2 extends StatefulWidget {
  const ExampleNotesF2({Key? key}) : super(key: key);

  @override
  State<ExampleNotesF2> createState() => _ExampleNotesF2State();
}

class _ExampleNotesF2State extends State<ExampleNotesF2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Note'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavBar(),
                  ),
                );
              },
              icon: const Icon(Icons.home))
        ],
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
                      'Clave de Fa',
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
                            top: 72,
                            left: 100,
                            child: IconButton(
                              onPressed: () {
                                playSound(1);
                                debugPrint('Botton de Nota Fa');
                              },
                              icon: const Icon(
                                Icons.music_note,
                                color: Colors.black87,
                                size: 30,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 58,
                            left: 145,
                            child: IconButton(
                              onPressed: () {
                                playSound(2);
                                debugPrint('Botton de Nota la');
                              },
                              icon: const Icon(
                                Icons.music_note,
                                color: Colors.black87,
                                size: 30,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 45,
                            left: 185,
                            child: IconButton(
                              onPressed: () {
                                playSound(3);
                                debugPrint('Botton de Nota Do');
                              },
                              icon: const Icon(
                                Icons.music_note,
                                color: Colors.black87,
                                size: 30,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 32,
                            left: 225,
                            child: IconButton(
                              onPressed: () {
                                playSound(4);
                                debugPrint('Botton de Nota Mi');
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
                    child: Text(
                        'Has click en los iconos ♩ para\npara escuchar la nota de cada\nespacio.'),
                  ),
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
      AudioPlayer()
          .play(AssetSource('sounds/notes/clave_de_fa/la_espacio.mp3'));
    } else if (note == 2) {
      AudioPlayer()
          .play(AssetSource('sounds/notes/clave_de_fa/do_espacio.mp3'));
    } else if (note == 3) {
      AudioPlayer()
          .play(AssetSource('sounds/notes/clave_de_fa/mi_espacio.mp3'));
    } else if (note == 4) {
      AudioPlayer()
          .play(AssetSource('sounds/notes/clave_de_fa/sol_espacio.mp3'));
    }
  }
}
