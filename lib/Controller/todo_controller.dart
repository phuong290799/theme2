import 'package:flutter/cupertino.dart';
import 'package:flutter_useinterface1/Data/databaseTodo.dart';
import 'package:flutter_useinterface1/Models/todo_model.dart';
import 'package:get/get.dart';

class TodoController extends GetxController{
  // RxList listTodo = RxList([]);
  static TodoController instance = Get.find();
  final dataBase = DatabaseTodo.instant;

  TextEditingController taskname= TextEditingController();
  TextEditingController devision= TextEditingController();
  TextEditingController branding= TextEditingController();

  insertTodo() {
    DatabaseTodo.instant.addTodo(Todo(1, taskname.text, "branding.text", devision.text));
  }
  getTodo() async{
    final list = await dataBase.getAllTodo();
    print(list[0].branding);
  }
}