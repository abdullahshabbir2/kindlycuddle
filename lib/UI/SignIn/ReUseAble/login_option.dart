import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginOption(String path, VoidCallback onTap){
  return InkWell(

    onTap: onTap,
    child: Container(
      width: 66.93,
      height: 50.68,
      padding: EdgeInsets.fromLTRB(21, 13, 21, 13),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          // side: BorderSide(width: 0.35, color: Colors.white),
          borderRadius: BorderRadius.circular(10.20),
        ),
      ),
      child: ReUseAbleSvg(path: path),
    ),
  );
}