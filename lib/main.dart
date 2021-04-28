import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Controller/todo_controller.dart';
import 'Data/databaseTodo.dart';
import 'package:flutter_useinterface1/Screens/splash.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseTodo.instant.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

