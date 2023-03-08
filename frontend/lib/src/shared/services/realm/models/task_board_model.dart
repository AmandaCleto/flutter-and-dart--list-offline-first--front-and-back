import 'package:list/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

part 'task_board_model.g.dart';

@RealmModel()
class _TaskBoard {
  @PrimaryKey()
  late Uuid id;
  late String title;
  late List<$Task> tasks;
  bool enable = true;
}
