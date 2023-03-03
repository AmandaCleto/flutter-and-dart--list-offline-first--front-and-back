import 'package:flutter/material.dart';

import 'home/home_page.dart';
import 'shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: dartTheme,
      home: const HomePage(),
    );
  }
}
