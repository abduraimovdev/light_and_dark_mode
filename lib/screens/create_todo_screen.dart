import 'dart:math';

import 'package:flutter/material.dart';
import 'package:light_and_dark_mode/main.dart';
import 'package:light_and_dark_mode/models/todo.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Create Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: "Description",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Todo todo = Todo(
            id: Random().nextInt(1000),
            title: titleController.text.trim(),
            description: descriptionController.text.trim(),
          );
          todoDb.storeData(todo);
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
