import 'package:app_vistoria_automoveis/database/classes/form_realizados.dart';
import 'package:app_vistoria_automoveis/database/classes/respostas.dart';
import 'package:flutter/material.dart';

class ViewFormController extends ChangeNotifier {
  ViewFormController();

  FormRealizado? _forms;
  FormRealizado? get forms => _forms;

  getData(){
    List<Resposta> respostas = [];
    respostas.add(Resposta(id: 0, pergunta: "Como esta a condição da roda?", resposta: "Deploravel", tipoResposta: 2));
    respostas.add(Resposta(id: 1, pergunta: "Existem itens de segurança faltando? Se sim quais?", resposta: "Extintor de incêndio", tipoResposta: 1));
    respostas.add(Resposta(id: 2, pergunta: "Data da ultima troca de pneus", resposta: "19/05/2018", tipoResposta: 4));
    respostas.add(Resposta(id: 2, pergunta: "Modificações não regulamentadas?", resposta: "Sim", tipoResposta: 3));
    _forms = FormRealizado(id: 1, nome: "Moto", usuario: "user2", data: DateTime.now(), respostas: respostas,placa: "AAA4444", renavam: "481014772");
    notifyListeners();
  }
}
