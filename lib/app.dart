import 'package:flutter/material.dart';
import 'package:light_and_dark_mode/main.dart';
import 'package:light_and_dark_mode/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hiveDb.getListenable,
      builder: (context, value, child) {
        return MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: hiveDb.mode,
          home: const HomeScreen(),
        );
      }
    );
  }
}
