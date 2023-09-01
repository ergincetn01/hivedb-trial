import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

// @HiveType(typeId: 0)
// class Contact {
//   @HiveField(0)
//   final String title;

//   @HiveField(1)
//   final bool isHere;

//   Contact(this.title, this.isHere);
// }

@HiveType(typeId: 0)
class BasicTile {
  int get id=>0;
  @HiveField(0)
  final String title;

  @HiveField(1)
  late bool isDone;

  @HiveField(2)
  final bool isChild;

  @HiveField(3)
  BasicTile({required this.title, required this.isDone, required this.isChild});
}


// class BasicTile {

//   final String title;
//   late bool isDone;
//   final bool isChild;
// // late String? childOf;
//   BasicTile(
//       {required this.title, required this.isDone, required this.isChild});
// }

final basicTiles = <BasicTile>[];

class BasicTileAdapter extends TypeAdapter<BasicTile> {
  @override
  int get typeId => 0;

  @override
  BasicTile read(BinaryReader reader) {
    final title = reader.readString();
    final isDone = reader.readBool();
    final isChild = reader.readBool();
    // final childOf = reader.readString();

    return BasicTile(title: title, isDone: isDone, isChild: isChild);
  }

  @override
  void write(BinaryWriter writer, BasicTile obj) {
    writer.writeString(obj.title);
    writer.writeBool(obj.isDone);
    writer.writeBool(obj.isChild);
    // writer.write(obj.childOf);
  }
}
