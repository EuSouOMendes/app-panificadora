// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ItemLongImage extends StatelessWidget {
  const ItemLongImage({super.key});

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width * 1;
    return SizedBox(
      width: largura - 35,
      child: Image.asset(
        'images/LongImage.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
