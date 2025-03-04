import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/OnBoarding/OnBoarding%20ReUseAble/screen_indicator.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_cubit.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_initial_params.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPage extends StatefulWidget {
  final OnBoardingCubit cubit;

  // final UserDeInitialParams initialParams;
  const OnBoardingPage({Key? key, required this.cubit}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  OnBoardingCubit get cubit => widget.cubit;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // List of image paths or assets that change upon swipe
  final List<String> _images = [
    ImageConstants
        .pngCuddleCareScreenImage, // Update with the correct image paths
    ImageConstants.pngCuddleCareScreenImage,
    ImageConstants.pngCuddleCareScreenImage,
  ];

  final List<String> _upperText = [
    "Nurturing Moments, Simplified 1", // Update with the correct image paths
    "Nurturing Moments, Simplified 2",
    "Nurturing Moments, Simplified 3",
  ];

  final List<String> _lowerText = [
    "Effortlessly track and manage your\nbreastfeeding sessions with Kindly Cuddle 1.", // Update with the correct image paths
    "Effortlessly track and manage your\nbreastfeeding sessions with Kindly Cuddle 2.",
    "Effortlessly track and manage your\nbreastfeeding sessions with Kindly Cuddle 3.",
  ];

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(OnBoardingInitialParams());
    cubit.navigator.context = context;
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
    return ScreenUtilInit(
      builder: (BuildContext context, child) => SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvoked: (isInvoked) {
            // Return false to disable back navigation
            // Return true to allow back navigation

            if (isInvoked) {
              debugPrint('back button Pressed');
              // cubit.moveToHomeScreen(context);
            }
            debugPrint('back button Pressed');
          },
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(height: 15.h),
                AssetsImages(path: ImageConstants.kindlyCuddle, height: 50),
                SizedBox(height: 15.h),
                // PageView for swipeable images
                ClipPath(
                  clipper: CurvedBottomClipper(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 450, // Adjust the height as needed
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Image.asset(_images[index], fit: BoxFit.cover);
                        }),
                  ),
                ),
                SizedBox(height: 15.h),
                // Heading Text
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: headingText(_upperText[_currentPage]),
                  ),
                ),
                SizedBox(height: 8.h),
                // Body Text
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: bodyText(
                      _lowerText[_currentPage],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                // Screen Indicator
                ScreenIndicator(_currentPage + 1),
                SizedBox(height: 14.h),
                // Get Started Button
                StyledButton(
                  text: 'Get Started',
                  onTap: cubit.moveToNextScreen,
                  height: 45,
                ),
              ],
            ),
          ),
        ),
      ),
      designSize: const Size(376.0, 812.0),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double offsetY = 50; // Adjust this value to move the shape lower
    double controlPointX = size.width;
    Path path = Path();
    path.lineTo(-50,
        (size.height / 2) + offsetY + 110); // Start drawing from bottom-left
    path.quadraticBezierTo(
      controlPointX - 200, // Control point x
      size.height + offsetY + 15, // Control point y
      size.width + 50, // End point x
      (size.height / 2) + offsetY + 110, // End point y
    );
    path.lineTo(size.width, 0); // Line to top-right
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
