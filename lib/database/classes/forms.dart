import 'package:app_vistoria_automoveis/database/classes/perguntas.dart';

class Forms{
  int id;
  String nome;
  List<Pergunta> perguntas;

  Forms({
    required this.id,
    required this.nome,
    required this.perguntas
  });

}
