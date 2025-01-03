// import 'package:cuddle_care/Constants/colors_constants.dart';
// import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
// import 'package:cuddle_care/UI/Home/home_page.dart';
// import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
// import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
// import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
// import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
// import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
// import 'package:cuddle_care/main.dart';
// import 'package:flutter/material.dart';
//
// class UserGuide extends StatefulWidget {
//   final String heading;
//   final String body;
//   final VoidCallback onTap;
//   final String? next;
//   final String img;
//   const UserGuide({super.key, required this.heading , required this.body, required this.onTap, this.next, required this.img});
//
//   @override
//   State<UserGuide> createState() => _UserGuideState();
// }
//
// class _UserGuideState extends State<UserGuide> {
//
//   ReSizeAbleSize size = ReSizeAbleSize();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 22,right: 22,top: 20,bottom: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           headingText('Kindly Cuddle Breast Pump',fontSize: 19,),
//           SizedBox(height: size.getResizeAbleHeight(10, 812, context),),
//           lightBlueText('Quick Start User Guide',fontSize: 19,height: 1),
//
//           // SizedBox(
//           //   width: 331,
//           //   child: Text.rich(
//           //     TextSpan(
//           //       children: [
//           //         TextSpan(
//           //           text: 'Kindly Cuddle Breast Pump\n',
//           //           style: TextStyle(
//           //             color: Color(0xFF222222),
//           //             fontSize: 19,
//           //             fontFamily: 'Arial Rounded MT Bold',
//           //             fontWeight: FontWeight.w400,
//           //             height: 1,
//           //             letterSpacing: -0.41,
//           //           ),
//           //         ),
//           //         TextSpan(
//           //           text: 'Quick Start User Guide',
//           //           style: TextStyle(
//           //             color: Color(0xFFB2CBF2),
//           //             fontSize: 19,
//           //             fontFamily: 'Arial Rounded MT Bold',
//           //             fontWeight: FontWeight.w400,
//           //             height: 1,
//           //             letterSpacing: -0.41,
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //     textAlign: TextAlign.center,
//           //   ),
//           // ),
//
//           SizedBox(height: size.getResizeAbleHeight(20, 812, context),),
//
//           SizedBox(
//             width: size.getResizeAbleWidth(331, 375, context),
//             height: size.getResizeAbleHeight(358, 812, context),
//             // decoration: ShapeDecoration(
//             //   color: Color(0xFFD9D9D9),
//             //   shape: RoundedRectangleBorder(
//             //     borderRadius: BorderRadius.circular(25),
//             //   ),
//             // ),
//             child: Image.asset(widget.img),
//           ),
//
//           SizedBox(height: size.getResizeAbleHeight(25, 812, context),),
//           SizedBox(
//               height: size.getResizeAbleHeight(30, 812, context),
//               // width: size.getResizeAbleHeight(183, 375, context),
//               child: lightBlueText(widget.heading,height: 1,fontSize: 18)),
//
//           SizedBox(height: size.getResizeAbleHeight(10, 812, context),),
//
//           SizedBox(
//             width: size.getResizeAbleWidth(292, 375, context),
//             height: size.getResizeAbleHeight(88, 812, context),
//             child: bodyText(widget.body,bodyFontSize: 14),
//           ),
//
//           SizedBox(height: size.getResizeAbleHeight(33, 812, context),),
//
//           SizedBox(
//             width: size.getResizeAbleWidth(80, 375, context),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: size.getResizeAbleWidth(24, 375, context),
//                   height:size.getResizeAbleHeight(6, 812, context),
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFB2CBF2),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                   ),
//                 ),
//                 Container(
//                   width: size.getResizeAbleWidth(6, 375, context),
//                   height: size.getResizeAbleHeight(6, 812, context),
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFB2CBF2).withOpacity(0.5),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                   ),
//                 ),
//                 Container(
//                   width: size.getResizeAbleWidth(6, 375, context),
//                   height: size.getResizeAbleHeight(6, 812, context),
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFB2CBF2).withOpacity(0.5),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                   ),
//                 ),
//                 Container(
//                   width: size.getResizeAbleWidth(6, 375, context),
//                   height: size.getResizeAbleHeight(6, 812, context),
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFB2CBF2).withOpacity(0.5),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                   ),
//                 ),
//                 Container(
//                   width: size.getResizeAbleWidth(6, 375, context),
//                   height: size.getResizeAbleHeight(6, 812, context),
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFB2CBF2).withOpacity(0.5),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                   ),
//                 )
//               ],
//             ),
//           ),
//
//           SizedBox(height: size.getResizeAbleHeight(36, 812, context),),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               StyledButton(text: 'Skip', onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage(cubit: getIt(param1: HomeInitialParams() )) ) );
//               },
//                 height: size.getResizeAbleHeight(48, 812, context) ,
//                 width:size.getResizeAbleWidth(118, 375, context) ,
//               ),
//
//               StyledButton(text: widget.next ??  'Next', onTap: widget.onTap,height: size.getResizeAbleHeight(48, 812, context) ,width:size.getResizeAbleWidth(118, 375, context) ,backgroundColor: Colors.white,textColor: ColorsConstants.styledButtonBackgroundColor,),
//
//
//             ],
//           ),
//
//         ],
//       ),
//     );
//   }
// }


import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:cuddle_care/UI/Home/home_page.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

class UserGuide extends StatefulWidget {
  final String heading;
  final String body;
  final VoidCallback onTap;
  final String next;
  final String img;

  const UserGuide({
    super.key,
    required this.heading,
    required this.body,
    required this.onTap,
    this.next = 'Next',
    required this.img,
  });

  @override
  State<UserGuide> createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  final ReSizeAbleSize size = ReSizeAbleSize();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
          // Swiping from right to left
          if (widget.onTap != null) {
            widget.onTap();
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: ListView(
          children: [
            Center(child: headingText('Kindly Cuddle Breast Pump', fontSize: 19)),
            SizedBox(height: size.getResizeAbleHeight(10, 812, context)),
            Center(child: lightBlueText('Quick Start User Guide', fontSize: 19, height: 1)),
            SizedBox(height: size.getResizeAbleHeight(20, 812, context)),
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
                child: bodyText(
                  widget.body,
                  bodyFontSize: 14,
                ),
              ),
            ),
            SizedBox(height: size.getResizeAbleHeight(33, 812, context)),
            _buildPageIndicator(),
            SizedBox(height: size.getResizeAbleHeight(36, 812, context)),
            _buildButtons(context),
          ],
        ),
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

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        bool isActive = index == 0;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
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

  Widget _buildButtons(BuildContext context) {
    return Row(
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
          height: size.getResizeAbleHeight(48, 812, context),
          width: size.getResizeAbleWidth(118, 375, context),
        ),
        StyledButton(
          text: widget.next,
          onTap: widget.onTap,
          height: size.getResizeAbleHeight(48, 812, context),
          width: size.getResizeAbleWidth(118, 375, context),
          backgroundColor: Colors.white,
          textColor: ColorsConstants.styledButtonBackgroundColor,
        ),
      ],
    );
  }
}
