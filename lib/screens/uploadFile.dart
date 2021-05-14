import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Controller/ImagesController.dart';
import 'package:flutter_useinterface1/Controller/controller.dart';
import 'package:flutter_useinterface1/Screens/taskDetail.dart';
import 'package:flutter_useinterface1/Theme/colors.dart';
import 'package:flutter_useinterface1/Theme/style.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UploadFile extends StatefulWidget {
  @override
  _UploadFileState createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  double precent=0.78;

  DateTime date = DateTime.now();
  String datevalue = DateFormat('yMMMMd').format(DateTime.now());
  List listImage = [];
  List listImageUpload = [];
  late File imageFile;
  final picker = ImagePicker();
  Controller controllerupload = Get.find();
  int pt=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    height: 350,
                    child: DragTarget(
                      onAccept: (data) {
                        setState(() {
                          listImage.add(data);
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          child: GridView.builder(
                             // physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.all(20),
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      mainAxisExtent: 150,
                                      //  childAspectRatio: 2 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemCount: listImage.length + 1,
                              itemBuilder: (BuildContext context, index) {
                                return index == listImage.length
                                    ? Container(
                                        child: InkWell(
                                          onTap: _showDialog,
                                          child: DottedBorder(
                                            color: Color(0xff253F50)
                                                .withOpacity(0.42),
                                            borderType: BorderType.RRect,
                                            radius: Radius.circular(7),
                                            child: Center(
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: AppColors.color702,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .color702)),
                                                child: Center(
                                                    child: Icon(
                                                  Icons.add,
                                                  color:
                                                      AppColors.color_scaffold,
                                                  size: 20,
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : LongPressDraggable(
                                        data: listImage[index],
                                        onDragCompleted: () {
                                          listImage.remove(listImage[index]);
                                        },
                                        feedback: Image.file(
                                          listImage[index],
                                          width: 200,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        childWhenDragging: DottedBorder(
                                          color: Color(0xff253F50)
                                              .withOpacity(0.42),
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(7),
                                          child: Container(),
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            child: Image.file(
                                              listImage[index],
                                              fit: BoxFit.cover,
                                            )),
                                      );
                              }),
                        );
                      },
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
                    padding:
                        const EdgeInsets.only(left: 20, top: 30, right: 20),
                    child: DragTarget(
                      onAccept: (data) {
                        setState(() {
                          listImageUpload.add(data);
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return listImageUpload.length == 0
                            ? Container(
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
                                          padding: const EdgeInsets.only(
                                              top: 70, bottom: 15),
                                          child: Image.asset(
                                              "assets/images/ic_file.png"),
                                        ),
                                        Text(
                                          "Drop your Image or Browse Here",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.color_text),
                                        ),
                                      ],
                                    )),
                                  ),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.only(top: 8),
                                height: 190,
                                child: DottedBorder(
                                  color: Color(0xff253F50).withOpacity(0.42),
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(7),
                                  child: GridView.builder(
                                      //  physics: NeverScrollableScrollPhysics,
                                      padding: EdgeInsets.all(20),
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              mainAxisExtent: 150,
                                              //  childAspectRatio: 2 / 2,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                      itemCount: listImageUpload.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return LongPressDraggable(
                                          data: listImageUpload[index],
                                          onDragCompleted: () {
                                            listImageUpload
                                                .remove(listImageUpload[index]);
                                          },
                                          feedback: Image.file(
                                            listImageUpload[index],
                                            width: 200,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                          childWhenDragging: DottedBorder(
                                            color: Color(0xff253F50)
                                                .withOpacity(0.42),
                                            borderType: BorderType.RRect,
                                            radius: Radius.circular(7),
                                            child: Container(),
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              child: Image.file(
                                                listImageUpload[index],
                                                fit: BoxFit.cover,
                                              )),
                                        );
                                      }),
                                ),
                              );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 17, bottom: 34, left: 20, right: 20),
                    child: Container(
                      height: 48,
                      child: RaisedButton(
                        onPressed: () {
                        //  ImagesController.instanceImage.insertImage();
                          showDialogUpload();
                          setState(() {
                            if(listImageUpload.length==0){
                              pt =1;
                            }
                            else{
                              pt = listImageUpload.length;
                            }
                              precent=precent ;
                              print(precent);
                            if(precent >=1){
                              Get.to(()=>TaskDetail());
                            }
                          });
                        },
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: AppColors.color702)),
                        color: AppColors.color702,
                        child: Center(
                            child: Text(
                          "Upload File",
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

  Future<void> showDialogUpload() {
    return showDialog(
        context: context,
        builder: (Buildcontext) {

          return Scaffold(
            backgroundColor: Colors.black12,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 200, 12, 0),
                child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.color_scaffold,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Text(
                                "Upload File",
                                style: TextStyle(
                                    fontSize: AppThemes.size14,
                                    color: AppColors.color702,
                                    fontFamily: AppThemes.fonRegular),
                              ),
                              Expanded(child: SizedBox()),
                              Padding(
                                padding: const EdgeInsets.only(right: 27),
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
                        Divider(
                          height: 0,
                          thickness: 1,
                          color: AppColors.color000.withOpacity(0.06),
                          indent: 0,
                          endIndent: 0,
                        ),
                       Padding(
                         padding: const EdgeInsets.all(20),
                         child: Container(
                           child: DottedBorder(
                             color: Color(0xff253F50)
                                 .withOpacity(0.42),
                             borderType: BorderType.RRect,
                             radius: Radius.circular(7),
                             child: Container(
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top: 32,bottom: 20),
                                     child:   new CircularPercentIndicator(
                                       radius: 120.0,
                                       lineWidth: 13.0,
                                       animation: true,
                                       percent: precent,
                                       center: new Text(
                                         "${precent*100}%",
                                         style:
                                         new TextStyle(fontFamily: AppThemes.fonSemiBold, fontSize: 21.0,color: AppColors.color702),
                                       ),
                                       backgroundColor: AppColors.color_scaffold,
                                       circularStrokeCap: CircularStrokeCap.round,
                                       progressColor: AppColors.color702,
                                     ),
                                     ),
                                   Container(
                                     child: Text("Upload 15 Files",style: TextStyle(
                                         fontSize: 12,
                                         color: AppColors.color_text,
                                         fontFamily: AppThemes.fonRegular),),
                                   ),
                                   Container(
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text("1 Gb from ",style: TextStyle(
                                             fontSize: 12,
                                             color: AppColors.color_text,
                                             fontFamily: AppThemes.fonRegular),),
                                         Text("4 Gb Uploaded",style: TextStyle(
                                             fontSize: 12,
                                             color: AppColors.color702,
                                             fontFamily: AppThemes.fonRegular),),
                                       ],
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.fromLTRB(17, 21, 17, 13),
                                     child: InkWell(
                                       onTap: (){
                                         Get.back();
                                       },
                                       child: Container(
                                         height: 50,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(width: 2,color: AppColors.color702)
                                         ),
                                         child: Center(
                                          child: Text(
                                             "Cancel",
                                             style: TextStyle(
                                                 fontSize: AppThemes.size14,
                                                 color: AppColors.color702,
                                                 fontFamily: AppThemes.fonMedium),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),

                         ),
                       ),
                      ],
                    )),
              ),
            ),
          );
        });
  }
  Future<void> _showDialog() {
    return showDialog(
        context: context,
        builder: (Buildcontext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Choose Image"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text(
                      "Choose in File",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onTap: () {
                      openGallary();
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  GestureDetector(
                    child: Text("Open Camera",
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                    onTap: () {
                      opencamera();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }


  Future<void> opencamera() async {
    var picture = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if (picture != null) {
        imageFile = File(picture.path);
        listImage.add(imageFile);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> openGallary() async {
    var picture = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      if (picture != null) {
        imageFile = File(picture.path);
        listImage.add(imageFile);
      } else {
        print('No image selected.');
      }
    });
  }
}
