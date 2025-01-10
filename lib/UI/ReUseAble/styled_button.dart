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
  const StyledButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.backgroundColor,
      this.textColor,
      this.height,
      this.width});

  @override
  State<StyledButton> createState() => _StyledButtonState();
}

class _StyledButtonState extends State<StyledButton> {
  double _elevation = 2.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          Colors.transparent, // Ensures the button can show a custom background
      elevation: _elevation, // Dynamic elevation based on the button state
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: widget.onTap,
        onTapDown: (_) {
          setState(() {
            _elevation = 8.0; // Increase elevation to simulate a press
          });
        },
        onTapUp: (_) {
          setState(() {
            _elevation = 2.0; // Normal elevation after release
          });
        },
        onTapCancel: () {
          setState(() {
            _elevation = 2.0; // Reset elevation if tap is cancelled
          });
        },
        child: Container(
          width: widget.width ?? 335.w,
          height: widget.height ?? 52.h,
          decoration: BoxDecoration(
            color: widget.backgroundColor ??
                ColorsConstants.styledButtonBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: headingText(
              widget.text,
              fontSize: 12.sp,
              customHeadingHeight: 0.09,
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
