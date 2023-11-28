class ModeloTransferencia {
  static final ModeloTransferencia _instancia = ModeloTransferencia._internal();

  factory ModeloTransferencia() {
    return _instancia;
  }

  ModeloTransferencia._internal();

  // Variáveis
  String nome = '';
  String bairro = '';
  String descricao = '';
}
