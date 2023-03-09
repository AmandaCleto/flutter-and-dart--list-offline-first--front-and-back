import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:list/src/shared/store/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = context.read<AppStore>();

    final syncDate = context.select(() => appStore.syncDate);

    var syncDataText = 'Nunca';

    if (syncDate != null) {
      final format = DateFormat('dd/MM/yyyy âs hh:mm');

      syncDataText = format.format(syncDate);
    }

    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/config');
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 26, 16, 16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sincronização',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    syncDataText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        )
      ],
    );
  }
}
