import 'package:flutter/material.dart';
import 'package:panificadora/Itens/itemBotoes.dart';
import 'package:panificadora/Itens/itemCard.dart';
import 'package:panificadora/Itens/itemTitulo.dart';
import 'package:panificadora/Itens/itemTituloh2.dart';
import 'package:panificadora/animacao.dart';
import 'package:panificadora/data_sqlite.dart';
import 'package:panificadora/pages/editar.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width * 1;
    ClasseDoSqlite classeDoSqlite = ClasseDoSqlite();

    return SafeArea(
        child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Item1(
          subtitulo: "Home",
        ),
        Botoes(state: const [true, false]),
        Tituloh2(),
        Expanded(
          flex: 200,
          child: FutureBuilder(
            future: classeDoSqlite.getAllRegistros(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Text('Erro ao carregar '),
                  ),
                );
              } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                return const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Text('cadastre algo'),
                  ),
                );
              } else {
                dynamic temp = snapshot.data;
                return ListView.builder(
                  itemCount: temp.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.center,
                      child: ItemCard(largura,
                          nome: temp[index]['nome'],
                          bairro: temp[index]['bairro'],
                          descricao: temp[index]['descricao'], fn: () {
                        Navigator.of(context).push(SlidePageRouteToRigth(
                            builder: (context) => PaginaEditar(
                                  data: {
                                    "id": temp[index]['id'].toString(),
                                    "nome": temp[index]['nome'],
                                    "bairro": temp[index]['bairro'],
                                    "descricao": temp[index]['descricao'],
                                  },
                                )));
                      }),
                    );
                  },
                );
              }
            }),
          ),
        ),
        // const Spacer(flex: 50)
      ],
    )));
  }
}
