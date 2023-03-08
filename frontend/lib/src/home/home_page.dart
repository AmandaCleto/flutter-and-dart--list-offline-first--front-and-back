import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import '../shared/services/realm/models/task_board_model.dart';
import '../shared/services/realm/models/task_model.dart';
import '../shared/widgets/user_image_button.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.fromLTRB(30, 90, 30, 200),
              itemCount: 10,
              itemBuilder: (_, index) {
                final board = TaskBoard(
                  Uuid.v4(),
                  'Nova Lista de tarefas 1',
                  tasks: [
                    Task(Uuid.v4(), ''),
                    Task(Uuid.v4(), '', complete: true),
                    Task(Uuid.v4(), '', complete: true),
                    Task(Uuid.v4(), '', complete: true),
                  ],
                );
                return TaskCard(
                  board: board,
                  height: 140,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(
                      value: 0,
                      label: Text('Todos'),
                    ),
                    ButtonSegment(
                      value: 1,
                      label: Text('Pendentes'),
                    ),
                    ButtonSegment(
                      value: 2,
                      label: Text('Concluídas'),
                    ),
                    ButtonSegment(
                      value: 3,
                      label: Text('Desativadas'),
                    ),
                  ],
                  selected: const {2},
                  onSelectionChanged: (value) {},
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
        label: const Text('Nova Lista'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
