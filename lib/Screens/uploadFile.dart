import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Controller/controller.dart';
import 'package:flutter_useinterface1/Theme/colors.dart';
import 'package:flutter_useinterface1/Theme/style.dart';
import 'package:get/get.dart';

class UploadFile extends StatelessWidget {
  Controller controllerupload = Get.find();
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
            Text("Upload File",
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
          width: MediaQuery.of(context).size.width,
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
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "Document",
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
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    height: 400,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 0,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 30,bottom: 10),
                          child: DottedBorder(
                            color: Color(0xff253F50).withOpacity(0.42),
                            borderType: BorderType.RRect,
                            radius: Radius.circular(7),
                            child: Center(
                              child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.color702,
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                  Border.all(color: AppColors.color702)),
                              child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.color_scaffold,
                                    size: 20,
                                  )),
                            ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,right: 20),
                          child: Container(
                            child: Image.asset(
                              "assets/images/image1.png",fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: 124,

                            child: Image.asset(
                              "assets/images/image2.png",fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            child: Image.asset(
                              "assets/images/image3.png",fit: BoxFit.contain,
                            ),
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
                    padding: const EdgeInsets.only(left: 20,top: 30,right: 20),
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
                                  padding: const EdgeInsets.only(top: 70,bottom: 15),
                                  child: Image.asset("assets/images/ic_file.png"),
                                ),
                                Text("Drop your Image or Browse Here",style: TextStyle(
                                  fontSize: 10,color: AppColors.color_text
                                ),),
                              ],
                            )),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:17,bottom: 34),
                    child: Container(
                      height: 48,
                      child: RaisedButton(
                        onPressed: () {
                       //   Get.to(()=>UploadFile());
                        },
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: AppColors.color702)
                        ),
                        color: AppColors.color702,
                        child: Center(
                            child: Text(
                              "Upload File",
                              style: TextStyle(color: AppColors.color_scaffold, fontSize:AppThemes.size12, fontFamily: AppThemes.fonBold),
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
