import 'package:list/src/shared/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

final config = Configuration.local(
  [
    ConfigurationModel.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
);
