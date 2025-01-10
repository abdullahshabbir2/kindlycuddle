import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:cuddle_care/UI/Home/home_page.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:cuddle_care/UI/User%20Guide/ReUseAble/user_guide.dart';
import 'package:cuddle_care/UI/User%20Guide/user_guide1_cubit.dart';
import 'package:cuddle_care/UI/User%20Guide/user_guide1_initial_params.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuide1Page extends StatefulWidget {
  final UserGuide1Cubit cubit;
  const UserGuide1Page({Key? key, required this.cubit}) : super(key: key);

  @override
  State<UserGuide1Page> createState() => _UserGuide1PageState();
}

class _UserGuide1PageState extends State<UserGuide1Page> {
  UserGuide1Cubit get cubit => widget.cubit;
  int index = 0;
  late PageController _pageController;
  final ReSizeAbleSize size = ReSizeAbleSize();

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    _pageController = PageController(initialPage: index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> userGuideImages = [
      ImageConstants.UserGuide1,
      ImageConstants.UserGuide2,
      ImageConstants.UserGuide3,
      ImageConstants.UserGuide4,
      ImageConstants.UserGuide5,
    ];

    List<String> userGuideHeading = [
      "Modes and Intensities",
      "Control Panel",
      "Cleaning",
      "Breast and Nipple Care",
      "How to Store Breast Milk",
    ];

    List<String> userGuideText = [
      'Customize the intensity of Baby, Stimulation, and Massage modes to suit your comfort. Save these preferences for consistent, personalized sessions.',
      'Manage each pump\'s function, battery level, and session duration easily. Adjust suction levels, set timers, and track milk volume for efficient pumping.',
      'Keep your pump clean with our specialized brushes, sold separately. Regular cleaning ensures hygiene and extends the lifespan of your device.',
      'Protect your skin with our disposable or reusable nipple pads. Proper care reduces discomfort and helps maintain healthy breastfeeding.',
      'Safely store your expressed milk using our milk bags. Proper storage ensures that your milk stays fresh and ready for your baby.',
    ];

    return ScreenUtilInit(
      builder: (BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: size.getResizeAbleHeight(10, 312, context)),
              Center(
                  child:
                      headingText('Kindly Cuddle Breast Pump', fontSize: 19)),
              SizedBox(height: size.getResizeAbleHeight(10, 812, context)),
              Center(
                  child: lightBlueText('Quick Start User Guide',
                      fontSize: 19, height: 1)),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: userGuideImages.length,
                  onPageChanged: (newIndex) {
                    setState(() {
                      index = newIndex;
                    });
                  },
                  itemBuilder: (context, index) {
                    return UserGuide(
                      index: index,
                      heading: userGuideHeading[index],
                      body: userGuideText[index],
                      onTap: () {
                        // Navigate to the next page on tap
                        if (index < userGuideImages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      img: userGuideImages[index],
                    );
                  },
                ),
              ),
              _buildPageIndicator(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Checkbox.width, vertical: Checkbox.width * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StyledButton(
                      text: 'Skip',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              cubit: getIt(param1: HomeInitialParams()),
                            ),
                          ),
                        );
                      },
                      height: 50,
                      width: 150,
                    ),
                    StyledButton(
                      text: index == 4 ? "Continue" : "Next",
                      onTap: () {
                        if (index == 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                cubit: getIt(param1: HomeInitialParams()),
                              ),
                            ),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      height: 50,
                      width: 150,
                      backgroundColor: Colors.white,
                      textColor: ColorsConstants.styledButtonBackgroundColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      designSize: const Size(375.0, 812.0),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (indicatorIndex) {
        bool isActive =
            indicatorIndex == index; // Compare with the current index
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: size.getResizeAbleWidth(isActive ? 24 : 6, 375, context),
          height: size.getResizeAbleHeight(6, 812, context),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFFB2CBF2)
                : const Color(0xFFB2CBF2).withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
