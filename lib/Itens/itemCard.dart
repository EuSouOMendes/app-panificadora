// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

Widget ItemCard(largura,
    {id = 0,
    nome = "Lorem ipsum",
    bairro = "Lorem ipsum",
    descricao = "Lorem ipsum",
    fn}) {
  return InkWell(
    onTap: () {
      fn();
    },
    child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 150,
        width: largura - 35,
        decoration: BoxDecoration(
          color: const Color(0xffE9E9E9),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(children: [
          //================================
          //      image container
          SizedBox(
              height: 150,
              child:
                  Image.asset("images/imgCartao.png", fit: BoxFit.fitHeight)),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("nome",
                            style: TextStyle(
                                fontSize: 22, color: Color(0xff4E4E4E)))),
                    Align(alignment: Alignment.centerLeft, child: Text(nome)),
                    // ====================================================================
                    const SizedBox(height: 10),
                    // ====================================================================
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("bairro",
                            style: TextStyle(
                                fontSize: 22, color: Color(0xff4E4E4E)))),
                    Align(alignment: Alignment.centerLeft, child: Text(bairro)),
                  ])))
        ])),
  );
}
