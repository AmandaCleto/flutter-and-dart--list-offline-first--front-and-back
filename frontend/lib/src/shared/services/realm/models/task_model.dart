import 'package:realm/realm.dart';

part 'task_model.g.dart';

@RealmModel()
class $Task {
  @PrimaryKey()
  late Uuid id;
  late String description;
  bool complete = false;
}
