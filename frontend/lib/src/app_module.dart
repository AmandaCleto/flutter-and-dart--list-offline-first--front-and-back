import 'package:flutter_modular/flutter_modular.dart';
import 'package:list/src/configuration/configuration_page.dart';
import 'package:list/src/configuration/services/configuration_service.dart';
import 'package:list/src/shared/services/realm/realm_config.dart';
import 'package:list/src/shared/store/app_store.dart';
import 'package:realm/realm.dart';

import './home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.instance<Realm>(Realm(config)),
        Bind.factory<ConfigurationService>((i) => ConfigurationServiceImp(i())),
        Bind.singleton((i) => AppStore(i())),
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
