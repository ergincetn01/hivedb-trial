import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:hivedb_trial/pages/home_page.dart";
import "package:hivedb_trial/util/basic_tile.dart";

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BasicTileAdapter());
  await Hive.openBox('mybox');
  
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
