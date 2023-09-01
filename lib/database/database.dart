import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivedb_trial/util/basic_tile.dart';

class Database {
  List<BasicTile> todoList = [];
 
  final _myBox = Hive.box('mybox');
  void createInitialData() {
    todoList = [];
    print("init...");
}
    // for(var i=0; i<todoList.length; i++){
    //   print(values[i]);
    // }
  

// List<BasicTile> getTiles() {
//     final tileList = _myBox.values.toList();
//     return tileList as List<BasicTile>;
// }

// void printValues(){
//  print(getTiles());
//  }


  // void getValues() {
  //   int j = 0;
  //   for (var i = 0; i < todoList.length; i++) {
  //     values[j] = _myBox.get(todoList[i].title);
  //     j++;
  //     print(values[j]);
  //   }
  // }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
    print("load data...");
  }

  void updateDb() {
    _myBox.put("TODOLIST", todoList);
    print("db update...");
    // getValues();
  }

}