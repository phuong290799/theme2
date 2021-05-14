import 'package:flutter_useinterface1/Models/picture_model.dart';
import 'package:flutter_useinterface1/Models/todo_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseTodo {
  static const String DB_NAME = "todo_database.db";
  static const String TABLE_TODO = "todos";
  static const String TABLE_IMAGE = "images";
  DatabaseTodo._internal();
  static final DatabaseTodo instant = DatabaseTodo._internal();

  late Database db;

  initDatabase() async {
    db = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      version: 1,
      onCreate: (dbb, version) {
        return dbb.execute(
          "CREATE TABLE $TABLE_TODO(id INTEGER PRIMARY KEY, task_name TEXT, division TEXT , branding TEXT)",
        );
      },
    );
    db = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      version: 1,
      onCreate: (dbb, version) {
        return dbb.execute(
          "CREATE $TABLE_IMAGE(id INTEGER PRIMARY KEY, title TEXT, picture BLOB )",
        );
      },
    );
  }

  //delete the database
  Future<void> deleteTodo(Todo todo) async {
    final Database db = DatabaseTodo.instant.initDatabase();
    db.delete(TABLE_TODO, where: "id = ?", whereArgs: [todo.id]);
  }

  Future<int> addTodo(Todo todo) async {
    return await db.insert(TABLE_TODO, todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Todo>> getAllTodo() async {
    List<Map<String, dynamic>> maps = await db.query(TABLE_TODO);
    return maps.map((e) => Todo.formJson(e)).toList();
  }

  Future savePicture(Picture picture) async {
    return
    await db.insert(TABLE_IMAGE, picture.toMap());
  }

  Future<List<Picture>> getPictures() async {
    List<Map> list = await db.rawQuery('SELECT * FROM $TABLE_IMAGE');
    List<Picture> pictures = [];
    for (int i = 0; i < list.length; i++) {
      pictures.add(new Picture(list[i]["id"], list[i]["text"], list[i]["picture"]));
    }
    print(pictures.length);
    return pictures;
  }
}

