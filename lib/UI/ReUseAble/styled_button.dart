import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyledButton extends StatefulWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final Color? textColor;
  final double? height;
  final double? width;
  const StyledButton({super.key , required this.text , required this.onTap , this.backgroundColor, this.textColor , this.height , this.width});

  @override
  State<StyledButton> createState() => _StyledButtonState();
}

class _StyledButtonState extends State<StyledButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          width: widget.width ?? 335.w,
          height: widget.height ?? 48.h,
          decoration: ShapeDecoration(
            color: widget.backgroundColor ?? ColorsConstants.styledButtonBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(child: headingText(widget.text,fontSize: 16.sp,customHeadingHeight: 0.09,color: widget.textColor))
      ),
    );
  }
}
