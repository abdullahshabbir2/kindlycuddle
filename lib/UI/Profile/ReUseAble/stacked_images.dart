import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/material.dart';

class ShowStackedImages extends StatelessWidget {
  final String imageUrl;
  final String sideImage;
  final Alignment? alignment;
  final int? height;
  final int? width;
  final bool profileAvailable;
  const ShowStackedImages({super.key,required this.imageUrl, required this.sideImage, this.alignment, this.height, this.width, required this.profileAvailable});

  @override
  Widget build(BuildContext context) {

    ReSizeAbleSize size = ReSizeAbleSize();

    return Stack(
      children: [
        Container(
            width: size.getResizeAbleWidth(width??180, 375, context),
            height: size.getResizeAbleHeight(height ?? 180, 812, context),
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: profileAvailable ?  NetworkImage(imageUrl) : const AssetImage('assets/noProfile.png') as ImageProvider,
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Align(
              alignment: alignment ??  Alignment.bottomCenter,
              child: ReUseAbleSvg(path: sideImage,height: size.getResizeAbleHeight(22, 812, context),width: size.getResizeAbleWidth(22, 375, context),),
            )
        ),
      ],
    );
  }
}
