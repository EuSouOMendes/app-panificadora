// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:panificadora/animacao.dart';
import 'package:panificadora/pages/cadastro.dart';
import 'package:panificadora/pages/home.dart';

// ignore: must_be_immutable
class Botoes extends StatelessWidget {
  List<bool> state;
  Botoes({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width * 1;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: largura - 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //========================================
          Botao(largura, state: state[0], nome: 'incio', fn: () {
            state[0]
                ? null
                : Navigator.of(context).pushAndRemoveUntil(
                    SlidePageRouteToRigth(
                        builder: (context) => const PaginaInicial()),
                    (route) => false,
                  );
          }),
          //========================================
          Botao(largura, state: state[1], nome: 'cadastro', fn: () {
            state[1]
                ? null
                : Navigator.of(context).pushAndRemoveUntil(
                    SlidePageRouteToLeft(
                        builder: (context) => const PaginaCadastro()),
                    (route) => false,
                  );
          }),

          //========================================
        ],
      ),
    );
  }
}

// ignore: use_function_type_syntax_for_parameters
Widget Botao(largura, {bool state = true, nome = '', required fn()}) {
  return InkWell(
    onTap: () {
      fn();
    },
    child: Container(
      alignment: Alignment.center,
      width: (largura / 2) - 15 - 15,
      height: 60,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.106),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          border: !state
              ? Border.all(
                  color: const Color.fromARGB(147, 78, 78, 78), width: 2.0)
              : null,
          color: state ? const Color(0xff133D56) : Colors.white,
          borderRadius: BorderRadius.circular(45)),
      child: Text(nome,
          style: TextStyle(
              fontSize: 18,
              color:
                  state ? Colors.white : const Color.fromARGB(147, 78, 78, 78),
              fontWeight: FontWeight.w500)),
    ),
  );
}
