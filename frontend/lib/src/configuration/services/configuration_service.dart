import 'package:list/src/shared/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

abstract class ConfigurationService {
  ConfigurationModel getConfiguration();
  void saveConfiguration(String themeModelName, DateTime? syncDate);
  void deleteAll();
}

class ConfigurationServiceImp implements ConfigurationService {
  final Realm realm;

  ConfigurationServiceImp(this.realm);

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themeModelName, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write(
      () {
        model
          ..syncDate = syncDate
          ..themeModeName = themeModelName;
      },
    );
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }
}
