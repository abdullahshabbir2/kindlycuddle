import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/show_data_with_time.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/material.dart';

class BlurredListView extends StatelessWidget {
  final int itemCount;
  final bool isDarkMode;

  const BlurredListView({
    Key? key,
    required this.itemCount,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: ReUseAbleSvg(
                    path: isDarkMode
                        ? ImageConstants.dropBackgorundDark
                        : ImageConstants.dropBackgorund,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bodyText('Thursday at 8:00 AM',
                          bodyFontSize: 14,
                          bodyTextColor:
                              Theme.of(context).colorScheme.onSecondaryFixed),
                    ],
                  ),
                  trailing: SizedBox(
                    width: 115,
                    child: showDataWithTime(context, 50, 25),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
