// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:panificadora/models/model.dart';

ModeloTransferencia instancia = ModeloTransferencia();

class ItemForms extends StatefulWidget {
  final Map<String, String> data;

  const ItemForms({Key? key, required this.data}) : super(key: key);

  @override
  State<ItemForms> createState() => _ItemFormsState();
}

class _ItemFormsState extends State<ItemForms> {
  late TextEditingController nomeController;
  late TextEditingController bairroController;
  late TextEditingController descricaoController;

  @override
  void initState() {
    super.initState();
    // Inicializar os seters com os valores do mapa data
    instancia.nome = widget.data["nome"] ?? "";
    instancia.bairro = widget.data["bairro"] ?? "";
    instancia.descricao = widget.data["descricao"] ?? "";
    // Inicializar os controladores com os valores do mapa data
    nomeController = TextEditingController(text: widget.data["nome"] ?? "");
    bairroController = TextEditingController(text: widget.data["bairro"] ?? "");
    descricaoController =
        TextEditingController(text: widget.data["descricao"] ?? "");
  }

  @override
  void dispose() {
    // Dispose dos controladores para evitar memory leaks
    nomeController.dispose();
    bairroController.dispose();
    descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width * 1;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: largura - 35,
          alignment: Alignment.center,
          child: TextField(
            onChanged: (value) {
              instancia.nome = value;
            },
            controller: nomeController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              hintText: 'Digite o nome',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff4E4E4E)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        // =================================================================================================
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: largura - 35,
          alignment: Alignment.center,
          child: TextField(
            controller: bairroController,
            onChanged: (value) {
              instancia.bairro = value;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              hintText: 'Digite o bairro',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff4E4E4E)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        // =================================================================================================
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0),
          width: largura - 35,
          alignment: Alignment.center,
          child: TextField(
            onChanged: (value) {
              instancia.descricao = value;
            },
            controller: descricaoController,
            maxLines: 3,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              hintText: 'Digite a descrição',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff4E4E4E)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        // =================================================================================================
      ],
    );
  }
}
