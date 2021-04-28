
import 'package:flutter_useinterface1/Models/todo_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseTodo {

  static const String DB_NAME = "todo_database.db";
  static const String TABLE_TODO = "todos";
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

// Future<bool> updateMovie(Todo todo) async {
//   final db = await database;
//   final result =
//   await db.update(TABLE_TODO, todo.toMap(), where: "id = ?", whereArgs: [todo.id]);
//   return result >= 0;
// }


}

