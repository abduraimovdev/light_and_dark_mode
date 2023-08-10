import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:light_and_dark_mode/models/todo.dart';

class HiveTodo {
  static String todoDB = "todoDB";
  static String todos = "todos";
  static Box<List<Map<String, Object?>>> box = Hive.box(todoDB);

  static Future<void> init() async{
    await Hive.initFlutter();
    if(!Hive.isBoxOpen(todoDB)) {
      await Hive.openBox<List<Map<String, Object?>>>(todoDB);
    }
  }

  void storeData(Todo todo) async {
    List<Map<String, Object?>> response = getData;
    response.add(todo.toJson());
    await box.put(todos, response);
  }

  void deleteData(int id) {
    List<Map<String, Object?>> response = getData;
    response.removeWhere((element) => (element["id"] as int) == id);
    box.put(todos, response);
  }


  ValueListenable<Box<List<Map<String, Object?>>>> get getListenable => box.listenable();

  List<Map<String, Object?>> get getData => box.get(todos) ?? <Map<String, Object?>>[];

}