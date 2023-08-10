import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDb {
  static String settings = "settings";
  static Box<bool> box = Hive.box(settings);

  static Future<void> init() async{
    await Hive.initFlutter();
    Hive.openBox<bool>(settings);
  }

  void storeData(bool isLight) async {
    await box.put("isLight", isLight);
  }

  void changeMode() async {
    await box.put("isLight", !isLight);
  }

  ThemeMode get mode => isLight ? ThemeMode.dark : ThemeMode.light;

  ValueListenable<Box<bool>> get getListenable => box.listenable();

  bool get isLight => ((box.get("isLight")) ?? false);
  
}