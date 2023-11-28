// ignore: file_names
// ignore_for_file: must_be_immutable, file_names, duplicate_ignore

import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  String titulo;
  String subtitulo;
  Item1({super.key, this.titulo = 'Panificadora', this.subtitulo = "Home"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontSize: 23),
          ),
          Text(
            subtitulo,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
