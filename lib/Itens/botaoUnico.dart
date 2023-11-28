// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

// ignore: use_function_type_syntax_for_parameters
BotaoUnico(largura, {nome = 'adicionar', status = true, required fn()}) {
  return InkWell(
    onTap: () {
      fn();
    },
    child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: 55,
        width: largura / 2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: status ? const Color(0xff133D56) : const Color(0xffAE4C4C)),
        child: Text(nome,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500))),
  );
}
