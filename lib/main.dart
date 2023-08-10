import 'package:flutter/material.dart';
import 'package:light_and_dark_mode/app.dart';
import 'package:light_and_dark_mode/services/hive_service.dart';
import 'package:light_and_dark_mode/services/todo_hive.dart';


final hiveDb = HiveDb();
final todoDb = HiveTodo();
void main() async{
  await HiveDb.init();
  await HiveTodo.init();
  runApp(const App());
}