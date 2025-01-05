import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:flutter/material.dart';

class AccountSign extends StatelessWidget {
  final String bodyString;
  final String actionText;
  final VoidCallback onTap;
  const AccountSign({super.key, required this.actionText ,required this.bodyString, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        bodyText(bodyString,bodyTextColor: ColorsConstants.textFieldTextColor,bodyFontSize: 11,bodyTextFontWeight: FontWeight.w400, bodyTextHeight: 0,bodyTextLetterSpacing: 0),
        InkWell(
            onTap: onTap,
            child: lightBlueText(actionText,fontSize:  15 ,fontWeight: FontWeight.w100,height: 1)
        )
      ],
    );
  }
}
