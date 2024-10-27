import 'package:flutter/material.dart';

Widget avatar(String url){
  return CircleAvatar(
    radius: 48,
    child: Image.network(url),
  );
}