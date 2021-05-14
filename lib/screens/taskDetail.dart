import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Controller/controller.dart';
import 'package:flutter_useinterface1/Controller/todo_controller.dart';
import 'package:flutter_useinterface1/Screens/task.dart';
import 'package:flutter_useinterface1/Screens/uploadFile.dart';
import 'package:flutter_useinterface1/Theme/colors.dart';
import 'package:flutter_useinterface1/Theme/style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskDetail extends StatefulWidget {
  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  DateTime date = DateTime.now();
  String datevalue = DateFormat('yMMMMd').format(DateTime.now());
  Controller controllerDetail = Get.find();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
                            datevalue,
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height:
                          controllerDetail.titleCheckCreate.length * 57, //266
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
                            child: InkWell(
                              onTap: ()
                              {
                                setState(() {
                                  controllerDetail
                                      .checkCreate[index]= ! controllerDetail
                                      .checkCreate[index] ;
                                });
                              },
                              child: Container(
                                height: 42,
                                child: Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1,
                                      child:

                                      Padding(
                                          padding: const EdgeInsets.only(left: 12,right: 10),
                                          child:  ! controllerDetail
                                              .checkCreate[index]?
                                          Container(
                                            height: 18,
                                            width: 18,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(3),
                                              border: Border.all(color: AppColors.color_border,width: 1),
                                            ),
                                          ): Container(
                                            height: 18,
                                            width: 18,
                                            decoration: BoxDecoration(
                                              color:AppColors.color702,
                                              borderRadius: BorderRadius.circular(3),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.check,color: Colors.white,size: 13,
                                              ),
                                            ),),
                                        ),
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
                          datevalue,
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
                    child: InkWell(
                      onTap: () {
                        Get.to(() => UploadFile());
                      },
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
                          datevalue,
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
                padding: const EdgeInsets.fromLTRB(27, 10, 21, 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: controllerDetail.listMemberSelect.length * 40,
                        width: 250,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controllerDetail.listMemberSelect.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                children: [
                                  Image.asset(controllerDetail
                                      .listMemberSelect[index].image),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controllerDetail
                                            .listMemberSelect[index].name,
                                        style: TextStyle(
                                            color: Color(0xff35425B),
                                            fontSize: AppThemes.size14,
                                            fontFamily: AppThemes.fonRegular),
                                      ),
                                      Text(
                                        controllerDetail
                                            .listMemberSelect[index].detail,
                                        style: TextStyle(
                                            color: AppColors.color_text,
                                            fontSize: AppThemes.size10,
                                            fontFamily: AppThemes.fonRegular),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          Get.bottomSheet(BottomSheetWidget());
                          // var sheetController = scaffoldKey.currentState!
                          //     .showBottomSheet(
                          //         (context) => BottomSheetWidget());
                          // sheetController.closed.then((value) {
                          //   print("closed");
                          // });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: AppColors.color_text)),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: AppColors.color_text,
                              ),
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
                      // Get.to(() => Task());
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
      height: 390,
      decoration: BoxDecoration(
          color: AppColors.color_scaffold,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(32, 20, 32, 0),
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
                    SizedBox(
                      height: 5,
                    ),
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
                    Get.appUpdate();
                    Get.back();
                  },
                  child: Container(
                    height: 31,
                    width: 31,
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
          Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.color_borderTF, width: 1),
              ),
              height: 40,
              child: TextField(
                //  style: TextStyle(fontSize: 14,fontFamily: AppThemes.fonMedium),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                      fontSize: AppThemes.size12,
                      color: AppColors.color_text,
                      fontFamily: AppThemes.fonRegular),
                  suffixIcon: Image.asset(
                    "assets/images/Search.png",
                    color: AppColors.color_borderTF,
                  ),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(6),
                  //     borderSide:
                  //         BorderSide(color: AppColors.color_borderTF)
                  // )
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            height: MediaQuery.of(context).size.height - 615, //266
            child: ListView.builder(
              itemCount: controllerDetail.listMember.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.color_scaffold,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child:  InkWell(
                    onTap: ()
                    {
                      setState(() {
                        controllerDetail.listMember[index].isSelect = !controllerDetail.listMember[index].isSelect ;
                        if (controllerDetail
                            .listMember[index].isSelect ==
                            true) {
                          controllerDetail.listMemberSelect.add(
                              controllerDetail.listMember[index]);
                        } else {
                          controllerDetail.listMemberSelect.remove(
                              controllerDetail.listMember[index]);
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset(controllerDetail.listMember[index].image),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
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

                           Padding(
                              padding: const EdgeInsets.only(left: 12,right: 10),
                              child:  !controllerDetail.listMember[index].isSelect?
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: AppColors.color_border,width: 1),
                                ),
                              ): Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  color:AppColors.color702,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,color: Colors.white,size: 13,
                                  ),
                                ),),
                            ),
                        ],
                      ),
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
