
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HelperRoutes.routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
  }

  @override
  void didPush() {
    super.didPush();
  }

  @override
  void didPop() {
    super.didPop();
  }

  @override
  void didPopNext() {
    super.didPopNext();
  }

  @override
  void didPushNext() {
    super.didPushNext();
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = context.watch<HomeController>();

    return Scaffold(
        appBar: const AppBarGeral(
          title: 'Menu',
          actions: [
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Text("Teste"),
            ),
          ],
        ),
      );
  }
}
