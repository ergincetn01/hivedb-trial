import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivedb_trial/util/basic_tile.dart';

class Database {
  List<BasicTile> todoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    todoList = [];
    print("init...");
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
    print("load data...");
  }

  void updateDb() {
    _myBox.put("TODOLIST", todoList);
    print("db update...");
  }
}
