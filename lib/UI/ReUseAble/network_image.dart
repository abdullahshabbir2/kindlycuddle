import 'package:flutter/cupertino.dart';

Widget reUseAbleOnlineImage(String url, {double? height, double? width}) {
  return Container(
    width: width,
    height: height,
    decoration: ShapeDecoration(
      image: DecorationImage(
        image: NetworkImage(url),
        // fit: BoxFit.cover,
      ),
      shape: OvalBorder(),
    ),

  );

  //   Container(
  //   decoration: ShapeDecoration(
  //     image: DecorationImage(image: NetworkImage(url)),
  //     shape: RoundedRectangleBorder(
  //       // side: const BorderSide(width: 1, color: Color(0xFFDCC5FF)),
  //       // borderRadius: BorderRadius.circular(100),
  //     ),
  //   ),
  //   // child: Image.network(
  //   //   url,
  //   //   height: height,
  //   //   width: width,
  //   //   fit: BoxFit.cover,
  //   // ),
  // );
}
