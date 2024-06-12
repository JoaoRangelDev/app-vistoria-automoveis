import 'dart:io';

import 'package:app_vistoria_automoveis/routes/constante_routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../database/classes/perguntas.dart';
import '../../routes/routes_observer.dart';
import '../../shared/widgets/AppBarGeral.dart';
import 'controller/form_controller.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<FormController>().getData();
      HelperRoutes.routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
  }

  @override
  Widget build(BuildContext context) {
    FormController controller = context.watch<FormController>();

    return Scaffold(
      appBar: const AppBarGeral(
        title: 'Formulário',
        actions: [],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: controller.forms?.perguntas.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Card(
                        color: Colors.blueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          buildPergunta(
                              controller.forms!.perguntas[index], controller),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(17))),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0.0,
              content: Wrap(
                direction: Axis.horizontal,
                spacing: 10,
                children: const <Widget>[
                  Center(
                    child: Icon(Icons.check_circle_outline,
                        color: Colors.white, size: 30),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Formulario salvo com sucesso!",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.green.shade800,
            ),
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
              HOME_PAGE_ROUTE, (Route<dynamic> route) => false);
        },
        child: const Icon(Icons.assignment_outlined),
      ),
    );
  }

  Widget buildPergunta(Pergunta pergunta, FormController controller) {
    switch (pergunta.tipoPergunta) {
      case 0:
        return Card(
          color: Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const <Widget>[
                Text("Preencha os dados do carro"),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome do Dono',
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Renavam',
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Placa do carro',
                  ),
                ),
              ],
            ),
          ),
        );
      case 1:
        return TextField(
          decoration: InputDecoration(
            labelText: pergunta.pergunta,
          ),
        );
      case 2:
        return Column(
          children: [
            Text(pergunta.pergunta),
            DropdownButton<String>(
              hint: const Text("Escolha:"),
              value: pergunta.valorDropdown,
              onChanged: (String? novoValor) {
                pergunta.valorDropdown = novoValor!;
                controller.atualiza();
              },
              items: pergunta.opcoesDropdown
                  ?.map<DropdownMenuItem<String>>((String opcao) {
                return DropdownMenuItem<String>(
                  value: opcao,
                  child: Text(opcao),
                );
              }).toList(),
            ),
          ],
        );
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(pergunta.pergunta),
            const SizedBox(width: 10),
            Switch(
              value: pergunta.valorRadioButton ?? false, // Set default to false
              onChanged: (bool novoValor) {
                pergunta.valorRadioButton = novoValor;
                controller.atualiza();
              },
            ),
          ],
        );
      case 4:
        return Column(
          children: [
            Text(pergunta.pergunta),
            ElevatedButton(
              onPressed: () async {
                final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: pergunta.data ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  pergunta.data = selectedDate;
                  controller.atualiza();
                }
              },
              child: Text(pergunta.data != null
                  ? '${pergunta.data?.day}/${pergunta.data?.month}/${pergunta.data?.year} '
                  : 'Nenhuma selecionada'),
            ),
          ],
        );
      case 5:
        return TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: pergunta.pergunta,
          ),
        );

      case 6:
        return Column(children: [
          ListTile(
              leading: const Icon(Icons.attach_file),
              title: Text(
                pergunta.pergunta,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                ImagePicker().pickImage(source: ImageSource.gallery).then(
                  (XFile? pickedFile) {
                    if (pickedFile != null) {
                      pergunta.file = pickedFile;
                      controller.atualiza();
                    }
                  },
                );
              },
              trailing: pergunta.file == null
                  ? const Icon(
                      Icons.image_search_rounded,
                    )
                  : Image.file(File(pergunta.file!.path))),
          const Divider(
            thickness: 1.3,
          ),
        ]);
      default:
        return const Text('Tipo de pergunta não suportado');
    }
  }

  void selectImage(int index) {}
}
