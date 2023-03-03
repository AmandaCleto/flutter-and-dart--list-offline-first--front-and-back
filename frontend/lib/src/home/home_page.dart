import 'package:flutter/material.dart';

import '../shared/widgets/user_image_button.dart';
import 'widgets/custom_drawer.dart';

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
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
                selected: const {0},
                onSelectionChanged: (value) {},
              ),
            ),
            Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Nova Lista'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}