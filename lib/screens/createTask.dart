import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Controller/controller.dart';
import 'package:flutter_useinterface1/Controller/todo_controller.dart';
import 'package:flutter_useinterface1/Screens/taskDetail.dart';
import 'package:flutter_useinterface1/Screens/uploadFile.dart';
import 'package:flutter_useinterface1/Theme/colors.dart';
import 'package:flutter_useinterface1/Theme/style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController taskname= TextEditingController();
  TextEditingController devision= TextEditingController();
  TextEditingController branding= TextEditingController();
  TextEditingController taskname2= TextEditingController();
  DateTime date = DateTime.now();
  String valueStart = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String valueDue = DateFormat('dd/MM/yyyy').format(DateTime.now());



  Future _selectDateStart() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2022),
    );
    valueStart = DateFormat('dd/MM/yyyy').format(picked!);
    if (picked != null) setState(() => valueStart = valueStart.toString());
  }

  Future _selectDateDue() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2022),
    );
    valueDue = DateFormat('dd/MM/yyyy').format(picked!);
    if (picked != null) setState(() => valueDue = valueDue.toString());
  }

  Controller controllerHome = Get.put(Controller());

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
            Text("Create Task",
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
          padding: EdgeInsets.fromLTRB(12,12,12,30),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 81.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Create New Task",
                        style: TextStyle(
                            fontSize: AppThemes.size20,
                            color: AppColors.color702,
                            fontFamily: AppThemes.fonMedium),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Are you ready?",
                        style: TextStyle(
                            fontSize: AppThemes.size12,
                            color: AppColors.color_text,
                            fontFamily: AppThemes.fonRegular),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10,
                  thickness: 2,
                  color: AppColors.color000.withOpacity(0.06),
                  indent: 0,
                  endIndent: 0,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Align(
                        child: Text(
                          "Task Name",
                          style: TextStyle(
                              fontSize: AppThemes.size12,
                              color: AppColors.color_text,
                              fontFamily: AppThemes.fonRegular),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: TodoController.instance.taskname,
                       //   controller: task,
                          //  style: TextStyle(fontSize: 14,fontFamily: AppThemes.fonMedium),
                          decoration: InputDecoration(
                              labelText: "UI/UX Design",
                              labelStyle: TextStyle(
                                  fontSize: AppThemes.size12,
                                  color: AppColors.color_text,
                                  fontFamily: AppThemes.fonRegular),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                      color: AppColors.color_borderTF))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        child: Text(
                          "Division",
                          style: TextStyle(
                              fontSize: AppThemes.size12,
                              color: AppColors.color_text,
                              fontFamily: AppThemes.fonRegular),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        child: Container(
                          height: 40,
                          child: TextField(
                            controller: TodoController.instance.devision,
                            //  style: TextStyle(fontSize: 14,fontFamily: AppThemes.fonMedium),
                            decoration: InputDecoration(
                                labelText: "Brand Management",
                                labelStyle: TextStyle(
                                    fontSize: AppThemes.size12,
                                    color: AppColors.color_text,
                                    fontFamily: AppThemes.fonRegular),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                        color: AppColors.color_borderTF))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        child: Text(
                          "Start/ Due Date",
                          style: TextStyle(
                              fontSize: AppThemes.size12,
                              color: AppColors.color_text,
                              fontFamily: AppThemes.fonRegular),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                          height: 40,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                width:
                                    MediaQuery.of(context).size.width * 142 / 360,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: AppColors.color_borderTF)),
                                child: GestureDetector(
                                  onTap: () {
                                    _selectDateStart();
                                  },
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Image.asset("assets/images/ic_day.png"),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          valueStart,
                                          style: TextStyle(
                                              fontSize: AppThemes.size14,
                                              color: AppColors.color_text,
                                              fontFamily: AppThemes.fonMedium),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: SizedBox(
                                width: 12,
                              )),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                width:
                                    MediaQuery.of(context).size.width * 142 / 360,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.color_container,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: AppColors.color_borderTF)),
                                child: GestureDetector(
                                  onTap: () {
                                    _selectDateDue();
                                  },
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Image.asset("assets/images/ic_day.png"),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          valueDue,
                                          style: TextStyle(
                                              fontSize: AppThemes.size14,
                                              color: AppColors.color_text,
                                              fontFamily: AppThemes.fonMedium),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        child: Text(
                          "Branding",
                          style: TextStyle(
                              fontSize: AppThemes.size12,
                              color: AppColors.color_text,
                              fontFamily: AppThemes.fonRegular),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: controllerHome.titleCheckCreate.length*57, //266
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controllerHome.titleCheckCreate.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: controllerHome.checkCreate[index]
                                      ? AppColors.color_scaffold
                                      : AppColors.color_form,
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: controllerHome.checkCreate[index]
                                          ? AppColors.color702
                                          : AppColors.color_form,
                                      width: 1)),
                              child:  InkWell(
                                onTap: ()
                                {
                                  setState(() {
                                    controllerHome.checkCreate[index] = !controllerHome.checkCreate[index] ;
                                  });
                                },
                                child: Container(
                                  height: 42,
                                  child: Row(
                                    children: [
                                      Padding(
                                    padding: const EdgeInsets.only(left: 12,right: 10),
                                    child:  !  controllerHome.checkCreate[index]?
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
                                      Text(
                                        controllerHome.titleCheckCreate[index],
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
                      InkWell(
                        onTap: (){
                          _showDialogCreat();
                        },
                        child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                              color: AppColors.color_scaffold,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: AppColors.color702)),
                          child: Center(
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  child: Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                        color: AppColors.color702,
                                        borderRadius: BorderRadius.circular(100),
                                        border:
                                            Border.all(color: AppColors.color702)),
                                    child: Center(
                                        child: Icon(
                                      Icons.add,
                                      color: AppColors.color_scaffold,
                                      size: 14,
                                    )),
                                  ),
                                ),
                                Text(
                                  "Moodboard Research for Color",
                                  style: TextStyle(
                                      fontSize: AppThemes.size14,
                                      color: AppColors.color_text,
                                      fontFamily: AppThemes.fonRegular),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 21,bottom: 14),
                        child: Align(
                          child: Text(
                            "Descriptions",
                            style: TextStyle(
                                fontSize: AppThemes.size12,
                                color: AppColors.color_text,
                                fontFamily: AppThemes.fonRegular),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(18),
                        height: 102,
                        decoration: BoxDecoration(
                            color: AppColors.color_form,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        child: Text("Please, the logo must represent the brand character, positioning, and the client USP and ESP.",
                          style: TextStyle(
                              fontSize: AppThemes.size14,
                              color: AppColors.color_text,
                              fontFamily: AppThemes.fonRegular),),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top:17,bottom: 34),
                        child: Container(
                          height: 48,
                          child: RaisedButton(
                            onPressed: () {
                             // TodoController.instance.insertTodo();
                             // TodoController.instance.getTodo();
                              Get.to(()=>TaskDetail());

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


              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialogCreat() {
    return showDialog(
        context: context,
        builder: (Buildcontext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Task Name"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: taskname2,
                    decoration: InputDecoration(
                      hintText: "Task Name"
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(top: 20)),
                  TextButton(
                      onPressed: () {
                        Get.back();
                        setState(() {
                          controllerHome.titleCheckCreate.add(taskname2.text.toString());
                          controllerHome.checkCreate.add(false);
                        });
                      },
                    child: Text("Create",
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
