import 'package:flutter_modular/flutter_modular.dart';
import 'package:list/src/configuration/configuration_page.dart';
import 'package:list/src/shared/store/app_store.dart';

import './home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AppStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        )
      ];
}
