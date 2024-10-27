import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/material.dart';

class ProfileListItem extends StatefulWidget {
  final String imgPath;
  final String title;
  final Widget? trailing;
  const ProfileListItem({super.key, required this.imgPath , required this.title , this.trailing });

  @override
  State<ProfileListItem> createState() => _ProfileListItemState();
}

class _ProfileListItemState extends State<ProfileListItem> {

  ReSizeAbleSize size = ReSizeAbleSize();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.getResizeAbleHeight(58, 812, context),
      width: size.getResizeAbleWidth(335, 375, context),
      child: ListTile(
        leading: ReUseAbleSvg(path: widget.imgPath),
        title: Row(
          children: [
            bodyText(widget.title),
          ],
        ),
        trailing: widget.trailing,
      ),
    );
  }
}
