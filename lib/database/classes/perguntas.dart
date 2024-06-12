import 'package:image_picker/image_picker.dart';

class Pergunta{
  int id;
  String pergunta;
  int tipoPergunta;
  List<String>? respostasDropdown;
  String? valorDropdown;
  List<String>? opcoesDropdown = [];
  bool? valorRadioButton;
  DateTime? data;
  XFile? file;

  Pergunta({
    required this.id,
    required this.pergunta,
    required this.tipoPergunta,
    this.valorDropdown,
    this.opcoesDropdown,
    this.valorRadioButton
  });
}