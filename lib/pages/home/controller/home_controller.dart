import 'package:app_vistoria_automoveis/database/classes/form_realizados.dart';
import 'package:app_vistoria_automoveis/database/classes/forms.dart';
import 'package:app_vistoria_automoveis/database/classes/perguntas.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  HomeController();

  final List<FormRealizado> _formsRealizados = [];
  List<FormRealizado> get formsRealizados => _formsRealizados;

  final List<Forms> _forms = [];
  List<Forms> get forms => _forms;

  getData() async {
    _formsRealizados.clear();
    _forms.clear();
    _formsRealizados.add(FormRealizado(id: 1, nome: "Carro", usuario: "user1", data: DateTime.now(), respostas: []));
    _formsRealizados.add(FormRealizado(id: 2, nome: "Moto", usuario: "user2", data: DateTime.now(), respostas: []));

    List<Pergunta> perguntas = [];
    Pergunta pergunta = Pergunta(id: 1, pergunta: "Quanto é", tipoPergunta: 1, opcoesDropdown: []);
    perguntas.add(pergunta);

    _forms.add(Forms(id: 1, nome: "Carro", perguntas: perguntas));
    _forms.add(Forms(id: 2, nome: "Moto", perguntas: perguntas));

    notifyListeners();
  }

  deletarFormulario(int index) {
    _formsRealizados.removeAt(index);
    notifyListeners();
  }



}
