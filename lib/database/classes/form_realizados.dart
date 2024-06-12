import 'package:app_vistoria_automoveis/database/classes/respostas.dart';

class FormRealizado {
  int id;
  String nome;
  String usuario;
  DateTime data;
  String? placa;
  String? renavam;
  List<Resposta> respostas;

  FormRealizado({
    required this.id,
    required this.nome,
    required this.usuario,
    required this.data,
    required this.respostas,
    this.placa,
    this.renavam
  });


}
