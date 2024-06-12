import 'package:image_picker/image_picker.dart';

class Resposta{
  int id;
  String pergunta;
  String resposta;
  int tipoResposta;
  XFile? imagemResposta;
  DateTime? data;

  Resposta({
    required this.id,
    required this.pergunta,
    required this.resposta,
    required this.tipoResposta
  });
}