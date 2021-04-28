import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Controller/todo_controller.dart';
import 'package:flutter_useinterface1/Screens/task.dart';
import 'package:flutter_useinterface1/Theme/colors.dart';
import 'package:flutter_useinterface1/Theme/style.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    TodoController controllerHome = Get.put(TodoController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: AppColors.color_scaffold,
        title: Row(
          children: [
            Image.asset(
              "assets/images/Search.png",
            ),
            Expanded(
              child: SizedBox(),
            ),
            Text("Projects",
                style: TextStyle(
                    fontSize: AppThemes.size16,
                    color: AppColors.color702,
                    fontFamily: AppThemes.fonSemiBold)),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
        actions: [
          Row(
                children: [
                  Image.asset("assets/images/Notify.png"),
                  SizedBox(
                    width: 16.6,
                  ),
                  Image.asset("assets/images/Avatar.png"),
                ],
              ),
          SizedBox(
            width: 18,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 112.5,
                ),
                Text(
                  "No tasks found?",
                    style: TextStyle(
                        fontSize: AppThemes.size20,
                        color: AppColors.color702,
                        fontFamily: AppThemes.fonRegular)
                ),
                SizedBox(
                  height: 44.9,
                ),
                Container(
                  child: Image.asset("assets/images/splash.png", width: 238.22),
                ),
                SizedBox(
                  height: 45.2,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  height: 63,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Try to assign more tasks to your",
                        style: TextStyle(color: AppColors.color606, fontSize: 12, fontFamily: AppThemes.fonRegular),
                      ),
                      Text(
                        "employees or create a new project from",
                        style: TextStyle(color: AppColors.color606, fontSize: 12, fontFamily: AppThemes.fonRegular),
                      ),
                      Text(
                        "scratch",
                        style: TextStyle(color: AppColors.color606, fontSize: 12, fontFamily: AppThemes.fonRegular),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(32,16,32,0),
                  child: Container(
                    height: 48,
                    child: RaisedButton(
                      onPressed: () {
                        Get.to(()=>Task());
                      },
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: AppColors.color702)
                        ),
                      color: AppColors.color702,
                      child: Center(
                          child: Text(
                        "Create New Task",
                            style: TextStyle(color: AppColors.color_scaffold, fontSize:AppThemes.size12, fontFamily: AppThemes.fonBold),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
