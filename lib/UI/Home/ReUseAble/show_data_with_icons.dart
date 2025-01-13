import 'package:cuddle_care/UI/Home/ReUseAble/show_data_with_unit.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:flutter/cupertino.dart';

Widget showDataWithIcons(
    double data, String unit, String name, String icon, BuildContext context) {
  return Container(
    // width: MediaQuery.of(context).size.width*(70/375),
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            bodyText(name, bodyFontSize: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width * (8 / 375),
            ),
            AssetsImages(path: icon),
          ],
        ),
        showDataWithUnit(context, data, unit),
      ],
    ),
  );
}
