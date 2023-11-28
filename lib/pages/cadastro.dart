import 'package:flutter/material.dart';
import 'package:panificadora/Itens/botaoUnico.dart';
import 'package:panificadora/Itens/itemBotoes.dart';
import 'package:panificadora/Itens/itemForms.dart';
import 'package:panificadora/Itens/itemImageLong.dart';
import 'package:panificadora/Itens/itemTitulo.dart';
import 'package:panificadora/Itens/itemTituloh2.dart';
import 'package:panificadora/animacao.dart';
import 'package:panificadora/data_sqlite.dart';
import 'package:panificadora/models/model.dart';
import 'package:panificadora/pages/home.dart';

class PaginaCadastro extends StatelessWidget {
  const PaginaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width * 1;
    ModeloTransferencia instancia = ModeloTransferencia();
    ClasseDoSqlite classeDoSqlite = ClasseDoSqlite();

    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Item1(
            subtitulo: "Cadastro",
          ),
          Botoes(state: const [false, true]),
          Tituloh2(),
          const ItemLongImage(),
          const ItemForms(data: {}),
          BotaoUnico(largura, fn: () async {
            if (instancia.nome.isNotEmpty &&
                instancia.bairro.isNotEmpty &&
                instancia.descricao.isNotEmpty) {
              await classeDoSqlite.insertRegistro(
                  instancia.nome, instancia.bairro, instancia.descricao);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushAndRemoveUntil(
                SlidePageRouteToRigth(
                    builder: (context) => const PaginaInicial()),
                (route) => false,
              );
            }
          }),
          // const Spacer(flex: 50)
        ],
      ),
    )));
  }
}
