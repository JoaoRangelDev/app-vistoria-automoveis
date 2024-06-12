import 'package:app_vistoria_automoveis/database/classes/forms.dart';
import 'package:app_vistoria_automoveis/pages/visualizar/controller/view_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routes/constante_routes.dart';
import '../../routes/routes_observer.dart';
import '../../shared/widgets/AppBarGeral.dart';

class ViewFormPage extends StatefulWidget {
  const ViewFormPage({Key? key}) : super(key: key);

  @override
  State<ViewFormPage> createState() => _ViewFormPageState();
}

class _ViewFormPageState extends State<ViewFormPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<ViewFormController>().getData();
      HelperRoutes.routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
  }

  @override
  Widget build(BuildContext context) {
    ViewFormController controller = context.watch<ViewFormController>();

    return Scaffold(
      appBar: const AppBarGeral(
        title: 'Visualizar',
        actions: [],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Card(
              elevation: 2,
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.forms!.nome,
                        ),
                        Text(controller.forms!.usuario),
                        Text(
                          "${controller.forms!.data.day}/${controller.forms!.data.month}/${controller.forms!.data.year}",
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Placa: ${controller.forms!.placa!}",
                        ),
                        Text("Renavam: ${controller.forms!.renavam!}"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: controller.forms?.respostas.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Card(
                        color: Colors.blueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(controller.forms!.respostas[index].pergunta),
                              Divider(),
                              Text("Resposta: ${controller.forms!.respostas[index].resposta}"),
                            ],
                          )
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
    );
  }
}
