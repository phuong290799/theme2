import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _appConstant =AppColors._internal();

  factory AppColors() {
    return _appConstant;
  }

  AppColors._internal();

  static const Color color702 = Color(0xff702DE3);
  static const Color color606 = Color(0xff606C83);
  static const Color color728 = Color(0xff72809D);

  static const Color color05C = Color(0xff05C3EB);
  static const Color colorFED = Color(0xffFED430);
  static const Color color000 = Color(0xff000000);
  static const Color colorB8B = Color(0xffB8BFCE);
  static const Color color354 = Color(0xff35425B);
  static const Color color_border = Color(0xffDCE0E7);
  static const Color color_borderTF = Color(0xffD7E1EA);

  static const Color color_scaffold = Color(0xffffffff);
  static const Color color_text = Color(0xff72809D);
  static const Color color_form = Color(0xffF7F9FB);
  static const Color color_container = Color(0xffF0F4F8);
}