import 'package:flutter/material.dart';
import 'package:light_and_dark_mode/app.dart';
import 'package:light_and_dark_mode/services/hive_service.dart';


final hiveDb = HiveDb();

void main() async{
  await HiveDb.init();
  runApp(const App());
}
