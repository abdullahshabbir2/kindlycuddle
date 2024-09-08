import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReUseAbleSvg extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  const ReUseAbleSvg({super.key , required this.path , this.height , this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height?.h,
      // width: width?.w,
      child: SvgPicture.asset(
        path,
          semanticsLabel: 'Acme Logo',
        fit: BoxFit.cover,
      ),
    );
  }
}


