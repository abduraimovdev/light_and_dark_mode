import 'package:flutter/material.dart';
import 'package:light_and_dark_mode/main.dart';
import 'package:light_and_dark_mode/models/todo.dart';
import 'package:light_and_dark_mode/screens/create_todo_screen.dart';

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
      body: ValueListenableBuilder(
        valueListenable: todoDb.getListenable,
        builder: (context, data, ___) {
          List list = (data.get("todos") ?? <Map<String, dynamic>>[]);
          List<Todo> response = list.map((e) => Todo.fromJson(e)).toList();
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: response.length,
            itemBuilder: (context, index) {
              Todo todo = response[index];
              return ListTile(
                leading: const Icon(Icons.circle_outlined),
                title: Text(todo.title),
                subtitle: Text(todo.title),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateTodoScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
