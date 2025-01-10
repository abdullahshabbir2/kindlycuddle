import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:cuddle_care/UI/Home/home_page.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserGuide extends StatefulWidget {
  final String heading;
  final String body;
  final VoidCallback onTap;
  final String img;
  final int index;

  const UserGuide(
      {super.key,
      required this.heading,
      required this.body,
      required this.onTap,
      required this.img,
      required this.index});

  @override
  State<UserGuide> createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  final ReSizeAbleSize size = ReSizeAbleSize();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // Only update after swipe is completed, check if the page has moved to an integer value
      if (_pageController.page != null) {
        int newPage = _pageController.page!.round();
        if (newPage != _currentPage) {
          setState(() {
            _currentPage = newPage;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: ListView(
        children: [
          SizedBox(height: size.getResizeAbleHeight(20, 712, context)),
          _buildImage(),
          SizedBox(height: size.getResizeAbleHeight(25, 812, context)),
          Center(
            child: lightBlueText(
              widget.heading,
              height: 1,
              fontSize: 18,
            ),
          ),
          SizedBox(height: size.getResizeAbleHeight(10, 812, context)),
          Center(
            child: SizedBox(
              width: size.getResizeAbleWidth(292, 375, context),
              height: 70,
              child: bodyText(
                widget.body,
                bodyFontSize: 14,
              ),
            ),
          ),
          SizedBox(height: size.getResizeAbleHeight(33, 812, context)),
          // _buildPageIndicator(),
          SizedBox(height: size.getResizeAbleHeight(36, 812, context)),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: SizedBox(
        width: size.getResizeAbleWidth(331, 375, context),
        height: size.getResizeAbleHeight(358, 812, context),
        child: Image.asset(widget.img),
      ),
    );
  }
}
