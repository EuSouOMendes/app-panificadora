// ignore_for_file: use_build_context_synchronously, must_be_immutable

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

class PaginaEditar extends StatelessWidget {
  Map<String, String> data;
  PaginaEditar({super.key, required this.data});

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
            subtitulo: "Editar",
          ),
          Botoes(state: const [false, false]),
          Tituloh2(),
          const ItemLongImage(),
          ItemForms(data: data),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(flex: 3),
              BotaoUnico(largura - 80, nome: "salvar", fn: () async {
                if (instancia.nome.isNotEmpty &&
                    instancia.bairro.isNotEmpty &&
                    instancia.descricao.isNotEmpty) {
                  await classeDoSqlite.updateRegistroById(
                      int.parse(data['id']!),
                      instancia.nome,
                      instancia.bairro,
                      instancia.descricao);
                  Navigator.of(context).pushAndRemoveUntil(
                    SlidePageRouteToRigth(
                        builder: (context) => const PaginaInicial()),
                    (route) => false,
                  );
                }
              }),
              const Spacer(flex: 1),
              BotaoUnico(largura - 50, status: false, nome: "deletar",
                  fn: () async {
                if (instancia.nome.isNotEmpty &&
                    instancia.bairro.isNotEmpty &&
                    instancia.descricao.isNotEmpty) {
                  await classeDoSqlite
                      .deleteRegistroById(int.parse(data["id"]!));
                  Navigator.of(context).pushAndRemoveUntil(
                    SlidePageRouteToRigth(
                        builder: (context) => const PaginaInicial()),
                    (route) => false,
                  );
                }
              }),
              const Spacer(flex: 3),
            ],
          )
          // const Spacer(flex: 50)
        ],
      ),
    )));
  }
}
