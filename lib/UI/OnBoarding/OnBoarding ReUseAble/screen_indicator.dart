import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ScreenIndicator(int selected){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Opacity(
        opacity: 0.50,
        child: Container(
          width: selected == 1 ? 24.w : 6.w,
          height: 6.h,
          decoration: ShapeDecoration(
            color: const Color(0xFFB2CBF2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      SizedBox(width: 8.w,),
      Opacity(
        opacity: 0.50,
        child: Container(
          width: selected == 2 ? 24.w : 6.w,
          height: 6,
          decoration: ShapeDecoration(
            color: const Color(0xFFB2CBF2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      SizedBox(width: 8.w,),
      Opacity(
        opacity: 0.50,
        child: Container(
          width: selected == 3 ? 24.w : 6.w,
          height: 6,
          decoration: ShapeDecoration(
            color: const Color(0xFFB2CBF2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
    ],
  );
}