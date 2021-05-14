
import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Data/databaseTodo.dart';
import 'package:flutter_useinterface1/Models/picture_model.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController{
  // RxList listTodo = RxList([]);
  static ImagesController instanceImage = Get.find();
  final dataBase = DatabaseTodo.instant;

  insertImage(image) {
    dataBase.savePicture(Picture(1,"anh1",image));
  }

    getImage() async{
      final list = await dataBase.getAllTodo();
      print(list[0].branding);
  }
}