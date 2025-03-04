import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/Service/ble/ble_controller.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:cuddle_care/UI/Session%20Options/ReUseAble/duration_button.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_cubit.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_initial_params.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_state.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_initial_params.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_page.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// class SessionOptionsPage extends StatefulWidget {
//   final SessionOptionsCubit cubit;
//   // final UserDeInitialParams initialParams;
//   const SessionOptionsPage({Key? key, required this.cubit}) : super(key: key);

//   @override
//   State<SessionOptionsPage> createState() => _SessionOptionsPageState();
// }

// class _SessionOptionsPageState extends State<SessionOptionsPage> {
//   SessionOptionsCubit get cubit => widget.cubit;

//   @override
//   void initState() {
//     super.initState();
//     // TODO : Fix it Later
//     cubit.onInit(SessionOptionsInitialParams());
//     cubit.navigator.context = context;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: (BuildContext context, child) => const SafeArea(
//         child: Scaffold(
//           body: Column(
//             children: [],
//           ),
//         ),
//       ),
//       designSize: const Size(393.0, 852.0),
//     );
//   }
// }

class SessionOptionsPage extends StatefulWidget {
  final SessionOptionsCubit cubit;
  const SessionOptionsPage({super.key, required this.cubit});

  @override
  State<SessionOptionsPage> createState() => _SessionOptionsPage();
}

class _SessionOptionsPage extends State<SessionOptionsPage> {
  final BleController bleController = Get.put(BleController());

  Map<String, int> minutesMAP = {
    '5 min': 5,
    '10 min': 10,
    '15 min': 15,
    '20 min': 20,
    'custom': 120
  };

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    widget.cubit.onInit(SessionOptionsInitialParams());
    widget.cubit.navigator.context = context;
  }

  ReSizeAbleSize size = ReSizeAbleSize();

  Widget showPump() => Center(
        child: Container(
          width: size.getResizeAbleWidth(248, 375, context),
          height: size.getResizeAbleHeight(140, 812, context),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFD0E2F6),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(
            child: Row(
              children: [
                ReUseAbleSvg(path: ImageConstants.pump),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bodyText('Pump 203'),
                    SizedBox(
                      height: size.getResizeAbleHeight(9, 812, context),
                    ),
                    ReUseAbleSvg(path: ImageConstants.startOptions)
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.getResizeAbleHeight(50, 912, context),
            ),
            showPump(),
            SizedBox(
              height: size.getResizeAbleHeight(10, 812, context),
            ),
            headingText('Start Session', fontSize: 24),
            SizedBox(
              height: size.getResizeAbleHeight(10, 812, context),
            ),
            lightBlueText('Please select session duration', fontSize: 14),
            SizedBox(
              height: size.getResizeAbleHeight(15, 812, context),
            ),
            BlocBuilder(
                bloc: widget.cubit,
                builder: (context, state) {
                  state as SessionOptionsState;

                  debugPrint('I am in BlocBuilder Start session');

                  return Column(
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        alignment: WrapAlignment.center,
                        spacing: 12, // Horizontal spacing between buttons
                        runSpacing: 12, // Vertical spacing between rows
                        children: [
                          DurationButton(
                            isSelected: state.durationIndex == 0,
                            text: '5 min',
                            onTap: () => widget.cubit.setDuration(0),
                          ),
                          DurationButton(
                            isSelected: state.durationIndex == 1,
                            text: '10 min',
                            onTap: () => widget.cubit.setDuration(1),
                          ),
                          DurationButton(
                            isSelected: state.durationIndex == 2,
                            text: '15 min',
                            onTap: () => widget.cubit.setDuration(2),
                          ),
                          DurationButton(
                            isSelected: state.durationIndex == 3,
                            text: '20 min',
                            onTap: () => widget.cubit.setDuration(3),
                          ),
                          DurationButton(
                            isSelected: state.durationIndex == 4,
                            text: 'Custom',
                            onTap: () => widget.cubit.setDuration(4),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
            SizedBox(
              height: size.getResizeAbleHeight(130, 812, context),
            ),
            BlocBuilder(
                bloc: widget.cubit,
                builder: (context, state) {
                  state as SessionOptionsState;
                  return StyledButton(
                    text: 'Turn On',
                    onTap: () async {
                      // int minutes =  minutesMAP[state.duration] ?? 0;
                      //
                      // // bleController.controlMaxWorkingHours(minutes);
                      //
                      // // widget.cubit.stopSession();
                      //
                      // minutes = (state.durationIndex + 1)*5;
                      // debugPrint('Minnutes: ${minutes}');
                      //
                      // bleController.controlOnOff(1);
                      bleController.controlOnOff(1);
                      //
                      // bleController.controlPause(0);
                      // bleController.controlPause(0);

                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SessionStartPage(
                      //     cubit: getIt(param1: SessionStartInitialParams() ),
                      //     seconds: minutes*60
                      // )
                      // ));
                    },
                    height: size.getResizeAbleHeight(61, 812, context),
                    textColor: Colors.white,
                    backgroundColor: ColorsConstants.styledButtonBackgroundColor
                        .withOpacity(0.5),
                  );
                }),
            SizedBox(
              height: size.getResizeAbleHeight(10, 812, context),
            ),
            BlocBuilder(
                bloc: widget.cubit,
                builder: (context, state) {
                  state as SessionOptionsState;
                  return StyledButton(
                    text: 'Start Session',
                    onTap: () async {
                      int minutes = minutesMAP[state.duration] ?? 0;
                      //
                      // // bleController.controlMaxWorkingHours(minutes);
                      //
                      // // widget.cubit.stopSession();
                      //
                      minutes = (state.durationIndex + 1) * 5;
                      // debugPrint('Minnutes: ${minutes}');
                      //
                      // bleController.controlOnOff(1);
                      // bleController.controlOnOff(1);
                      //
                      // bleController.controlPause(0);
                      bleController.controlPause(0);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SessionStartPage(
                                  cubit: getIt(
                                      param1: SessionStartInitialParams()),
                                  seconds: minutes * 60)));
                    },
                    height: size.getResizeAbleHeight(61, 812, context),
                    textColor: Colors.white,
                    backgroundColor: ColorsConstants.styledButtonBackgroundColor
                        .withOpacity(0.5),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
