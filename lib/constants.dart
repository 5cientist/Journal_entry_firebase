import 'package:flutter/material.dart';

const kScreenBg = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xff21d4fd),
      Color(0xffb721ff),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
);

const kButtonText = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 32,
  color: Colors.white,
);


const kTextFiled=BoxDecoration(
  color: Colors.black26,
  borderRadius: BorderRadius.all(Radius.circular(10),),
);