import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Controller/controller.dart';
import 'package:flutter_useinterface1/Screens/create%20task.dart';
import 'package:flutter_useinterface1/Theme/colors.dart';
import 'package:flutter_useinterface1/Theme/style.dart';
import 'package:get/get.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  Color color_select = AppColors.color_form;
  Controller controllerHome = Get.put(Controller());
  int _selectedIndex = 0;

  int count_account =2;
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
            Text("Task",
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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12,12,12,30),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.color_scaffold,
              borderRadius: BorderRadius.circular(10
               // topRight: Radius.circular(10),
              //  topLeft: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    color: AppColors.color000.withOpacity(0.16),
                    blurRadius: 30,
                    offset: Offset(5, 15))
              ]),
          child: Column(
            children: [
              Container(
                height: 81.5,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Task Checklist",
                      style: TextStyle(fontSize: AppThemes.size20,color: AppColors.color702,fontFamily: AppThemes.fonMedium),),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child:Container(
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.lightBlueAccent
                              ),
                              child: Center(child: Text("+${count_account}",
                                style: TextStyle(
                                    fontSize: 12,color: AppColors.color_scaffold,fontFamily: AppThemes.fonSemiBold
                                ),)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 34,top: 2),
                            child: Image.asset("assets/images/avatar3.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: Image.asset("assets/images/avatar2.png"),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Image.asset("assets/images/avatar1.png"),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                  ],
                ),

              ),
              Divider(
                height: 20,
                thickness: 2,
                color: AppColors.color000.withOpacity(0.06),
                indent: 0,
                endIndent: 0,
              ),
              Container(
                padding: EdgeInsets.only(top: 8),
                height: MediaQuery.of(context).size.height-300,//266
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),////////
                  itemCount: controllerHome.titleCheck.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child:
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              color: controllerHome.check[index]?AppColors.color_scaffold:AppColors.color_form,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: controllerHome.check[index]?AppColors.color702:AppColors.color_form, width: 1)),
                          child: Container(
                            height: 42,
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1,
                                  child: Checkbox(
                                    side:BorderSide(color: AppColors.color_border,width: 1),
                                    shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(3),
                                      ),

                                    ),
                                      activeColor: AppColors.color702,
                                      value: controllerHome.check[index],
                                      onChanged: (value) {
                                        setState(() {
                                          controllerHome.check[index] = value!;
                                        });
                                      }),
                                ),
                                Text(
                                  controllerHome.titleCheck[index],
                                  style: TextStyle(
                                      fontSize: AppThemes.size14,
                                      color: AppColors.color_text,
                                      fontFamily: AppThemes.fonRegular),
                                ),
                                Expanded(child: SizedBox()),
                                Container(
                                  padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                  decoration: BoxDecoration(
                                    color: controllerHome.colors_text[index].withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    controllerHome.title[index],
                                    style: TextStyle(
                                        fontSize: AppThemes.size10,
                                        color: controllerHome.colors_text[index],
                                        fontFamily: AppThemes.fonMedium),
                                  ),
                                ),
                                SizedBox(width: 9,),
                              ],
                            ),
                          ),
                        ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 48,
                width: 296,
                child: RaisedButton(
                  onPressed: () {
                    Get.to(()=>CreateTask());
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
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/ic_calenda.png"),
              color: AppColors.color728,
            ),
            activeIcon: ImageIcon(
              AssetImage("assets/images/ic_calenda.png"),
              color: AppColors.color702,
            ),

            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/ic_activity.png"),
              color: AppColors.color728,
            ),
            activeIcon: ImageIcon(
              AssetImage("assets/images/ic_activity.png"),
              color: AppColors.color702,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/ic_add.png"),
              color: AppColors.color728,
            ),
            activeIcon: ImageIcon(
              AssetImage("assets/images/ic_add.png"),
              color: AppColors.color702,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/ic_document.png"),
              color: AppColors.color728,
            ),
            activeIcon: ImageIcon(
              AssetImage("assets/images/ic_document.png"),
              color: AppColors.color702,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/ic_setting.png"),
              color: AppColors.color728,
            ),
            activeIcon: ImageIcon(
              AssetImage("assets/images/ic_setting.png"),
              color: AppColors.color702,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: AppColors.color702,
        onTap: _onItemTapped,
      ),

    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
