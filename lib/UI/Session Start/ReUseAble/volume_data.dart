import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:flutter/material.dart';

class VolumeData extends StatelessWidget {
  final String orientation;
  final double data;
  final bool isColorWhite;
  const VolumeData({super.key, required this.orientation , required this.data,required this.isColorWhite});

  @override
  Widget build(BuildContext context) {

    ReSizeAbleSize size = ReSizeAbleSize();


    return  Container(
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: isColorWhite ? Colors.white :  ColorsConstants.appPrimary2,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      child: Column(
        children: [
          bodyText(orientation,bodyFontSize: 11),
          SizedBox(height: size.getResizeAbleHeight(4, 812, context)),
          Row(
            children: [
              headingText(data.toString(),fontSize: 11),
              SizedBox(width: size.getResizeAbleWidth(4, 375, context)),
              bodyText('OZ',bodyFontSize: 11)
            ],
          ),
        ],
      ),
    );
  }
}
