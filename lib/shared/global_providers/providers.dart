import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../pages/formulario/controller/form_controller.dart';
import '../../pages/home/controller/home_controller.dart';
import '../../pages/visualizar/controller/view_form_controller.dart';

final providers = <SingleChildWidget>[
  ChangeNotifierProvider<HomeController>(
    create: (context) => HomeController(),
  ),
  ChangeNotifierProvider<FormController>(
    create: (context) => FormController(),
  ),
  ChangeNotifierProvider<ViewFormController>(
    create: (context) => ViewFormController(),
  ),
];
