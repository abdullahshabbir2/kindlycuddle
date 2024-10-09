import 'package:flutter/cupertino.dart';

Widget roundedImage(String url){
  return Container(
    // decoration: ShapeDecoration(shape: RoundedRectangleBorder()),
    child: ClipOval(
      child: Image(
        image: NetworkImage(
          url
        ),
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      ),
    ),
  );
}