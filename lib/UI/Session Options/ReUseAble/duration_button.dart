import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:flutter/material.dart';

class DurationButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  const DurationButton({super.key, required this.isSelected,required this.text, required this.onTap});

  
  @override
  Widget build(BuildContext context) {

    ReSizeAbleSize size = ReSizeAbleSize();

    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.getResizeAbleWidth(76, 375, context),
        height: size.getResizeAbleHeight(33, 812, context),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: isSelected ?  ColorsConstants.blueTextColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: headingText(text,color: isSelected ? Colors.white : ColorsConstants.blueTextColor,fontSize: 14),
      ),
    );
  }
}
