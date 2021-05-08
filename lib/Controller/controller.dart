import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useinterface1/Models/memberObj.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class Controller extends GetxController {
  List<String> titleCheck = [
    "UX Research",
    'Awareness',
    'Creare New UI-Pertamina',
    'Moodboard Audience',
    'Audience Moodboard',
    'Color Pallete',
    "Tipography Study",
    "Sketch basic Logo",
    "Purchase Mockup"
  ];
  List<String> titleCheckCreate = [
    // 'Color Pallete',
    // "Tipography Study",
    // "Purchase Mockup"
  ];
  List<bool> checkCreate = [
  // false,
  // false,
  // false,
  ];
  List<bool> check = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<String> title = [
    'Branding',
    'UI/UX',
    'UI/UX',
    'Degital',
    'Strategist',
    'Degital',
    'Strategist',
    'Branding',
    'Digital'
  ];
  List<Color> colors_text = [
    Color(0xff05C3EB),
    Color(0xffFED430),
    Color(0xffFED430),
    Color(0xff702DE3),
    Color(0xffFF0000),
    Color(0xff702DE3),
    Color(0xffFF0000),
    Color(0xff05C3EB),
    Color(0xff702DE3),
  ];
  List<bool> checkMember = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<MemberObj> listMember=[
    MemberObj("assets/images/avatar3.png", "Tonny Stark", "Project Manager",false),
    MemberObj("assets/images/avatar2.png", "Elizabeth Olsen","Project Manager",false),
    MemberObj("assets/images/avatar1.png", "Lulu Utek", "UX Designer",false),
    MemberObj("assets/images/avatar1.png", "Tonny Stark","Project Manager",false),
    MemberObj("assets/images/avatar2.png", "Elizabeth Olsen", "Project Manager",false),
    MemberObj("assets/images/avatar3.png", "Lulu Utek", "UX Designer",false),
    MemberObj("assets/images/avatar1.png", "Tonny Stark", "Project Manager",false),
    MemberObj("assets/images/avatar2.png", "Elizabeth Olsen","Project Manager",false),
    MemberObj("assets/images/avatar3.png", "Lulu Utek", "UX Designer",false),
    MemberObj("assets/images/avatar1.png", "Tonny Stark", "Project Manager",false),
    MemberObj("assets/images/avatar2.png", "Elizabeth Olsen","Project Manager",false),
    MemberObj("assets/images/avatar3.png", "Lulu Utek", "UX Designer",false),
  ];
  List<MemberObj> listMemberSelect=[

  ];

}
