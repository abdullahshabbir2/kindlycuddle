
import 'package:flutter/material.dart';

class ReSizeAbleSize{
  double getResizeAbleHeight(int height , int screenSize,BuildContext context ){
    return MediaQuery.of(context).size.height*(height/screenSize);
  }
  double getResizeAbleWidth(int width , int screenSize,BuildContext context ){
    return MediaQuery.of(context).size.width*(width/screenSize);
  }
}