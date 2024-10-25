import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/material.dart';

class PLayPauseOption extends StatelessWidget {
  final String align;
  final String image;
  final String time;
  final VoidCallback onTap;
  const PLayPauseOption({super.key, required this.time , required this.image , required this.align, required this.onTap});

  @override
  Widget build(BuildContext context) {

    ReSizeAbleSize size = ReSizeAbleSize();


    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: size.getResizeAbleHeight(21, 812, context),),
          bodyText(align),
          SizedBox(height: size.getResizeAbleHeight(12, 812, context),),
          Row(
            children: [
              SizedBox(width: size.getResizeAbleWidth(12, 375, context),),
              ReUseAbleSvg(path: image),
              SizedBox(width: size.getResizeAbleWidth(12, 375, context),),
            ],
          ),
          SizedBox(height: size.getResizeAbleHeight(19, 812, context),),
          Row(
            children: [
              SizedBox(width: size.getResizeAbleWidth(12, 375, context),),
              headingText(time,fontSize: 16),
              SizedBox(width: size.getResizeAbleWidth(12, 375, context),),
            ],
          )
        ],
      ),
    );
  }
}
