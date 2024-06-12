import 'package:app_vistoria_automoveis/database/classes/forms.dart';
import 'package:flutter/material.dart';

import '../../../database/classes/perguntas.dart';

class FormController extends ChangeNotifier {
  FormController();

  Forms? _forms;
  Forms? get forms => _forms;

  getData() {
    _forms = null;
    List<Pergunta> perguntas = [];
    Pergunta pergunta = Pergunta(id: 0, pergunta: "", tipoPergunta: 0);
    Pergunta pergunta1 = Pergunta(id: 1, pergunta: "Observações", tipoPergunta: 1,);
    Pergunta pergunta2 = Pergunta(
      pergunta: 'Marca do Carro',
      tipoPergunta: 2,
      valorDropdown: null, // Valor inicial nulo
      opcoesDropdown: ['Fiat', 'Chevrolet', 'Volkswagen', 'Ford', 'Renault'], id: 2,
    );
    Pergunta pergunta3 = Pergunta(
      pergunta: 'Habilitado?',
      tipoPergunta: 3, id: 3, // Use radioButton here
    );
    Pergunta pergunta4= Pergunta(
      pergunta: 'Data de Nascimento',
      tipoPergunta: 4, id: 4,
    );
    Pergunta pergunta5 = Pergunta(id: 5, pergunta: "Quanto é", tipoPergunta: 5,);
    Pergunta pergunta6 = Pergunta(id: 6, pergunta:  "Foto do carro", tipoPergunta: 6);
    perguntas.add(pergunta);
    perguntas.add(pergunta1);
    perguntas.add(pergunta2);
    perguntas.add(pergunta3);
    perguntas.add(pergunta4);
    perguntas.add(pergunta5);
    perguntas.add(pergunta6);
    _forms = Forms(id: 1, nome: "Carro", perguntas: perguntas);
    notifyListeners();
  }

  atualiza(){
    notifyListeners();
  }


}
