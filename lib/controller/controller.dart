import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Models/memberObj.dart';
import 'package:flutter_useinterface1/Models/taskObj.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class Controller extends GetxController {
  List<TaskObj> listTask = [
    TaskObj("UX Research", 'Branding', Color(0xff05C3EB), false),
    TaskObj('Awareness', 'UI/UX', Color(0xffFED430), false),
    TaskObj('Creare New UI-Pertamina', 'UI/UX', Color(0xffFED430), false),
    TaskObj('Moodboard Audience', 'Degital', Color(0xff702DE3), false),
    TaskObj('Audience Moodboard', 'Strategist', Color(0xffFF0000), false),
    TaskObj("Tipography Study", 'Degital', Color(0xff702DE3), false),
    TaskObj("Tipography Study", 'Strategist', Color(0xffFF0000), false),
    TaskObj("Sketch basic Logo", 'Branding', Color(0xff05C3EB), false),
    TaskObj("Purchase Mockup", 'Digital', Color(0xff702DE3), false),
  ];
  List<String> titleCheckCreate = [];
  List<bool> checkCreate = [];
  List<MemberObj> listMember = [
    MemberObj(
        "assets/images/avatar3.png", "Tonny Stark", "Project Manager", false),
    MemberObj("assets/images/avatar2.png", "Elizabeth Olsen", "Project Manager",
        false),
    MemberObj("assets/images/avatar1.png", "Lulu Utek", "UX Designer", false),
    MemberObj(
        "assets/images/avatar1.png", "Tonny Stark", "Project Manager", false),
    MemberObj("assets/images/avatar2.png", "Elizabeth Olsen", "Project Manager",
        false),
    MemberObj("assets/images/avatar3.png", "Lulu Utek", "UX Designer", false),
    MemberObj(
        "assets/images/avatar1.png", "Tonny Stark", "Project Manager", false),
    MemberObj("assets/images/avatar2.png", "Elizabeth Olsen", "Project Manager",
        false),
    MemberObj("assets/images/avatar3.png", "Lulu Utek", "UX Designer", false),
    MemberObj(
        "assets/images/avatar1.png", "Tonny Stark", "Project Manager", false),
    MemberObj("assets/images/avatar2.png", "Elizabeth Olsen", "Project Manager",
        false),
    MemberObj("assets/images/avatar3.png", "Lulu Utek", "UX Designer", false),
  ];
  List<MemberObj> listMemberSelect = [];
}
