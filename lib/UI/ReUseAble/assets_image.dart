import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetsImages extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  const AssetsImages({super.key, required this.path, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Image(
      height: (height)?.h,
      width: (width)?.w,
      image: AssetImage(path),
      fit: BoxFit.contain,
    );
  }
}
