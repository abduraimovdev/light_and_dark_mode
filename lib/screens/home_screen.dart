import 'package:flutter/material.dart';
import 'package:light_and_dark_mode/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
        actions: [
          IconButton(
            onPressed: () {
              hiveDb.changeMode();
            },
            icon: const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: const Center(
        child: Text("Hello World"),
      ),
    );
  }
}
