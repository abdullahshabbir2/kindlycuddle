import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavigator extends StatefulWidget {
  final int index;
  final Function onTap;
  const MyBottomNavigator(
      {super.key, required this.index, required this.onTap});

  @override
  State<MyBottomNavigator> createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.index != 2,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * (90 / 712),
            width: MediaQuery.of(context).size.width * (343 / 375),
            child: SvgPicture.asset(
              ImageConstants.bottomRectangle,
              width: MediaQuery.of(context).size.width * (343 / 375),
              height: MediaQuery.of(context).size.height * (102 / 512),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * (90 / 812),
            width: MediaQuery.of(context).size.width * (343 / 375),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyNavBarItem(
                    path: widget.index == 0
                        ? ImageConstants.home_2
                        : ImageConstants.home2,
                    onTap: () {
                      widget.onTap(0);
                    }),
                MyNavBarItem(
                    path: widget.index == 1
                        ? ImageConstants.pieChart_1
                        : ImageConstants.pieChart2,
                    onTap: () {
                      widget.onTap(1);
                    }),
                InkWell(
                  onTap: () {
                    widget.onTap(2);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * ((10) / 812),
                        ),
                        ReUseAbleSvg(
                          path: ImageConstants.pumpIcon,
                          height: 56,
                          width: 56,
                        ),
                      ],
                    ),
                  ),
                ),
                MyNavBarItem(
                    path: ImageConstants.book2,
                    onTap: () {
                      widget.onTap(3);
                    }),
                MyNavBarItem(
                    path: widget.index == 4
                        ? ImageConstants.setting_1
                        : ImageConstants.setting,
                    onTap: () {
                      widget.onTap(4);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyNavBarItem extends StatelessWidget {
  final double? sizedboxHeight;
  final String path;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  const MyNavBarItem(
      {super.key,
      this.sizedboxHeight,
      required this.path,
      required this.onTap,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height *
                ((sizedboxHeight ?? 44) / 812),
          ),
          ReUseAbleSvg(
            path: path,
            height: height ?? 28,
            width: width ?? 28,
          ),
        ],
      ),
    );
  }
}
