import 'package:app_vistoria_automoveis/database/classes/forms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routes/constante_routes.dart';
import '../../routes/routes_observer.dart';
import '../../shared/widgets/AppBarGeral.dart';
import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<HomeController>().getData();
      HelperRoutes.routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
  }

  // @override
  // void didPush() {
  //   super.didPush();
  // }
  //
  // @override
  // void didPop() {
  //   super.didPop();
  // }
  //
  // @override
  // void didPopNext() {
  //   super.didPopNext();
  // }
  //
  // @override
  // void didPushNext() {
  //   super.didPushNext();
  // }

  @override
  Widget build(BuildContext context) {
    HomeController controller = context.watch<HomeController>();

    return Scaffold(
      appBar: const AppBarGeral(
        title: 'Menu',
        actions: [],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.formsRealizados.length,
              itemBuilder: (context, index) {

                final form = controller.formsRealizados[index];
                return Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Card(
                        color: Colors.blueAccent,
                        elevation: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  form.nome,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  form.usuario,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "${controller.formsRealizados[index].data.day}/${controller.formsRealizados[index].data.month}/${controller.formsRealizados[index].data.year}",
                                  style: const TextStyle(fontSize: 14.0),
                                ),
                                const SizedBox(width: 10.0),
                                IconButton(
                                  icon: const Icon(Icons.remove_red_eye_outlined),
                                  onPressed: () {Navigator.pushNamed(context,
                                      VIEW_FORM_PAGE_ROUTE);
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {showDeletarDialog(context,index, controller);},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple,
        notchMargin: 7,
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.check_box),
              onPressed: () {},
            ),

            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(17))),
        onPressed: () {
          showVistoriasDialog(context, controller.forms);
        },
        child: const Icon(Icons.assignment_outlined),
      ),
    );
  }

  void showVistoriasDialog(BuildContext context, List<Forms> forms) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Vistorias'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: forms.length,
              itemBuilder: (context, index) {
                final form = forms[index];
                return Card(
                  color: Colors.blueAccent,
                  elevation: 2,
                  child: ListTile(
                    title: Text(form.nome),
                    onTap: () {
                      Navigator.pop(context);
        Navigator.pushNamed(context,
            FORM_PAGE_ROUTE);

                    },
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void showDeletarDialog(context, int index,HomeController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Vistorias'),
          content: const SizedBox(
            width: double.maxFinite,
            child: Text("Deseja deletar essa vistoria?")
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Deletar',style: TextStyle(color: Colors.red),),
              onPressed: () {
                controller.deletarFormulario(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
