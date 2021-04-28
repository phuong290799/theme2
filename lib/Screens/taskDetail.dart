import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Controller/controller.dart';
import 'package:flutter_useinterface1/Controller/todo_controller.dart';
import 'package:flutter_useinterface1/Screens/uploadFile.dart';
import 'package:flutter_useinterface1/Theme/colors.dart';
import 'package:flutter_useinterface1/Theme/style.dart';
import 'package:get/get.dart';

class TaskDetail extends StatefulWidget {
  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  Controller controllerDetail = Get.find();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
            Text("Task Detail",
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
          child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 30),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.color_scaffold,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: AppColors.color000.withOpacity(0.16),
                    blurRadius: 30,
                    offset: Offset(5, 15))
              ]),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 90,
                child: Column(
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Align(
                      child: Text(
                        "Interface Design",
                        style: TextStyle(
                            fontSize: AppThemes.size20,
                            color: AppColors.color702,
                            fontFamily: AppThemes.fonMedium),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 29),
                      child: Row(
                        children: [
                          Image.asset("assets/images/ic_time.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "09 : 00  AM",
                            style: TextStyle(
                                fontSize: AppThemes.size12,
                                color: AppColors.color_text,
                                fontFamily: AppThemes.fonRegular),
                          ),
                          Expanded(child: SizedBox()),
                          Image.asset(
                            "assets/images/ic_day.png",
                            height: 14,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "August 24, 2020",
                            style: TextStyle(
                                fontSize: 8,
                                color: AppColors.color_text,
                                fontFamily: AppThemes.fonRegular),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: AppColors.color000.withOpacity(0.06),
                indent: 0,
                endIndent: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                child: Column(
                  children: [
                    Align(
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: AppThemes.size14,
                            color: AppColors.color702,
                            fontFamily: AppThemes.fonRegular),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Communicate clear deadlines and   expectations, and keep everyone on your   team aligned and motivated.",
                        style: TextStyle(
                            fontSize: AppThemes.size14,
                            color: AppColors.color_text,
                            fontFamily: AppThemes.fonRegular),
                      ),
                    ),
                    Row(
                      children: [],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      height: MediaQuery.of(context).size.height - 680, //266
                      child: ListView.builder(
                        itemCount: controllerDetail.titleCheckCreate.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controllerDetail.checkCreate[index]
                                    ? AppColors.color_scaffold
                                    : AppColors.color_form,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    color: controllerDetail.checkCreate[index]
                                        ? AppColors.color702
                                        : AppColors.color_form,
                                    width: 1)),
                            child: Container(
                              height: 42,
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 1,
                                    child: Checkbox(
                                        side: BorderSide(
                                            color: AppColors.color_border,
                                            width: 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(3),
                                          ),
                                        ),
                                        activeColor: AppColors.color702,
                                        value:
                                            controllerDetail.checkCreate[index],
                                        onChanged: (value) {
                                          setState(() {
                                            controllerDetail
                                                .checkCreate[index] = value!;
                                          });
                                        }),
                                  ),
                                  Text(
                                    controllerDetail.titleCheckCreate[index],
                                    style: TextStyle(
                                        fontSize: AppThemes.size14,
                                        color: AppColors.color_text,
                                        fontFamily: AppThemes.fonRegular),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "Upload File",
                        style: TextStyle(
                            fontSize: AppThemes.size14,
                            color: AppColors.color702,
                            fontFamily: AppThemes.fonRegular),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(right: 29),
                        child: Text(
                          "August 24, 2020",
                          style: TextStyle(
                              fontSize: 8,
                              color: AppColors.color_text,
                              fontFamily: AppThemes.fonRegular),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: AppColors.color000.withOpacity(0.06),
                indent: 0,
                endIndent: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                child: DottedBorder(
                  color: Color(0xff253F50).withOpacity(0.42),
                  borderType: BorderType.RRect,
                  radius: Radius.circular(7),
                  child: Container(
                    height: 190,
                    child: Center(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70, bottom: 15),
                          child: Image.asset("assets/images/ic_file.png"),
                        ),
                        Text(
                          "Drop your Image or Browse Here",
                          style: TextStyle(
                              fontSize: 10, color: AppColors.color_text),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, left: 20),
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "Assigned To : ",
                        style: TextStyle(
                            fontSize: AppThemes.size14,
                            color: AppColors.color702,
                            fontFamily: AppThemes.fonRegular),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(right: 29),
                        child: Text(
                          "August 24, 2020",
                          style: TextStyle(
                              fontSize: 8,
                              color: AppColors.color_text,
                              fontFamily: AppThemes.fonRegular),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 30,
                thickness: 1,
                color: AppColors.color000.withOpacity(0.06),
                indent: 0,
                endIndent: 0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(27, 20, 21, 40),
                child: Container(
                  child: Row(
                    children: [
                      Image.asset("assets/images/avatar3.png"),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "Tonny Stark",
                            style: TextStyle(
                                color: Color(0xff35425B),
                                fontSize: AppThemes.size14,
                                fontFamily: AppThemes.fonRegular),
                          ),
                          Text(
                            "Project Manager",
                            style: TextStyle(
                                color: AppColors.color_text,
                                fontSize: AppThemes.size10,
                                fontFamily: AppThemes.fonRegular),
                          )
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          var sheetController = scaffoldKey.currentState!
                              .showBottomSheet(
                                  (context) => BottomSheetWidget());
                          sheetController.closed.then((value) {
                            print("closed");
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.color_text)),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.color_text,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 17, 20, 30),
                child: Container(
                  height: 48,
                  child: RaisedButton(
                    onPressed: () {
                      Get.to(() => UploadFile());
                    },
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: AppColors.color702)),
                    color: AppColors.color702,
                    child: Center(
                        child: Text(
                      "Add New Task",
                      style: TextStyle(
                          color: AppColors.color_scaffold,
                          fontSize: AppThemes.size12,
                          fontFamily: AppThemes.fonBold),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  Controller controllerDetail = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 406,
      decoration: BoxDecoration(
        color: AppColors.color_scaffold,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(32, 20,32, 0),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Team Members",
                      style: TextStyle(
                          color: AppColors.color702,
                          fontSize: AppThemes.size20,
                          fontFamily: AppThemes.fonBold),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "12 Active Member",
                      style: TextStyle(
                          color: AppColors.color_text,
                          fontSize: AppThemes.size12,
                          fontFamily: AppThemes.fonRegular),
                    )
                  ],
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                  },
                  child: Container(height: 31,width: 31,
                    decoration: BoxDecoration(
                      color: AppColors.color702,
                        borderRadius: BorderRadius.circular(100),
                       ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColors.color_scaffold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 40,
            thickness: 1,
            color: AppColors.color000.withOpacity(0.06),
            indent: 15,
            endIndent: 15,
          ),
          Container(
            child: Container(
              padding: EdgeInsets.fromLTRB(32, 0,32, 0),
              height: 40,
              child: TextField(
                //  style: TextStyle(fontSize: 14,fontFamily: AppThemes.fonMedium),
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontSize: AppThemes.size12,
                        color: AppColors.color_text,
                        fontFamily: AppThemes.fonRegular),
                        suffixIcon: Image.asset("assets/images/Search.png",color: AppColors.color_borderTF,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),

                        borderSide: BorderSide(
                            color: AppColors.color_borderTF))),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            height: MediaQuery.of(context).size.height - 600, //266
            child: ListView.builder(
              itemCount: controllerDetail.listMember.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color:  AppColors.color_scaffold,
                      borderRadius: BorderRadius.circular(7),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(32, 0,32, 0),
                    height: 50,
                    child: Row(
                      children: [
                       Image.asset(controllerDetail.listMember[index].image),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controllerDetail.listMember[index].name,
                              style: TextStyle(
                                  fontSize: AppThemes.size14,
                                  color: AppColors.color354,
                                  fontFamily: AppThemes.fonRegular),
                            ),
                            Text(
                              controllerDetail.listMember[index].detail,
                              style: TextStyle(
                                  fontSize: AppThemes.size10,
                                  color: AppColors.color_text,
                                  fontFamily: AppThemes.fonRegular),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Transform.scale(
                          scale: 1,
                          child: Checkbox(
                              side: BorderSide(
                                  color: AppColors.color_border,
                                  width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3),
                                ),
                              ),
                              activeColor: AppColors.color702,
                              value:
                              controllerDetail.checkMember[index],
                              onChanged: (value) {
                                setState(() {
                                  controllerDetail
                                      .checkMember[index] = value!;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


