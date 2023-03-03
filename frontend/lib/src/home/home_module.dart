import 'package:flutter_modular/flutter_modular.dart';
import 'package:list/src/home/edit_task_board_page.dart';
import 'package:list/src/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute(
          '/edit',
          child: (context, args) => const EditTaskBoardPage(),
        ),
      ];
}
