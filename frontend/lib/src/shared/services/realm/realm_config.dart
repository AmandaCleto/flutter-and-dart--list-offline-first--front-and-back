import 'package:list/src/shared/services/realm/models/configuration_model.dart';
import 'package:list/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

final config = Configuration.local(
  [
    Task.schema,
    TaskBoard.schema,
    ConfigurationModel.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
);
