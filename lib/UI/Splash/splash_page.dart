import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/Splash/Splash_initial_params.dart';
import 'package:cuddle_care/UI/Splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SplashPage extends StatefulWidget {
//   final SplashCubit cubit;
//   // final UserDeInitialParams initialParams;
//   const SplashPage({Key? key, required this.cubit}) : super(key: key);
//
//
//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }
//
// class _SplashPageState extends State<SplashPage> {
//
//   SplashCubit get cubit => widget.cubit;
//
//   @override
//   void initState() {
//     super.initState();
//     // TODO : Fix it Later
//     cubit.onInit(SplashInitialParams());
//    cubit.navigator.context =  context;
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder:(BuildContext context, child) => SafeArea(
//         child: Scaffold(
//           body: Column(
//             children: [
//               Stack(
//                 children: [
//                   Expanded(child: ReUseAbleSvg(path: ImageConstants.backgroundImage)),
//
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//       designSize: const Size(393.0, 852.0),
//     );
//   }
// }


class SplashPage extends StatefulWidget {
  final SplashCubit cubit;
  // final UserDeInitialParams initialParams;
  const SplashPage({Key? key, required this.cubit}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO: Fix it Later
    cubit.onInit(SplashInitialParams());
    cubit.navigator.context = context;

    Future.delayed(Duration(seconds: 4), (){
      cubit.moveToNextScreen();
    });

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand, // Makes the Stack's children take the full available space
            children: [
              ReUseAbleSvg(path: ImageConstants.backgroundImage),
              // You can add more widgets on top of the background here
              Center(
                child: ReUseAbleSvg(path: ImageConstants.iconImage),
              ),
            ],
          ),
        ),
      ),
      designSize: const Size(376.0, 812.0),
    );
  }
}