import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/Session%20Options/ReUseAble/play_pause_option.dart';
import 'package:cuddle_care/UI/Session%20Start/ReUseAble/volume_data.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_cubit.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_initial_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionStartPage extends StatefulWidget {
  final SessionStartCubit cubit;
  // final UserDeInitialParams initialParams;
  const SessionStartPage({Key? key, required this.cubit}) : super(key: key);


  @override
  State<SessionStartPage> createState() => _SessionStartPageState();
}

class _SessionStartPageState extends State<SessionStartPage> {

  SessionStartCubit get cubit => widget.cubit;
  ReSizeAbleSize size = ReSizeAbleSize();

  Widget top() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment:   CrossAxisAlignment.start,
        children: [
          headingText('Session',customHeadingHeight: 1),
          lightBlueText('Pump 203 Connected',fontSize: 14,height: 1)
        ],
      ),
      ReUseAbleSvg(path: ImageConstants.startOptions)
    ],
  );

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(SessionStartInitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                top(),
                Container(
                  width: size.getResizeAbleWidth(335, 375, context),
                  height: size.getResizeAbleHeight(242, 812, context),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Colors.white.withOpacity(0.6100000143051147), ColorsConstants.appPrimary2],
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PLayPauseOption(time: '5:10', image: ImageConstants.playButton, align: 'Left'),
                        PLayPauseOption(time: '5:02', image: ImageConstants.pauseButton, align: 'Right'),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: size.getResizeAbleHeight(16, 375, context),),

                //
                bodyText('Total Time'),
                headingText('10:12:00',fontSize: 40),

                Container(
                  width: size.getResizeAbleWidth(335, 375, context),
                  height: size.getResizeAbleHeight(235, 812, context),
                  // clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: ColorsConstants.appPrimary2.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.getResizeAbleHeight(14, 812, context),),
                      Row(
                        children: [
                          SizedBox(width: size.getResizeAbleWidth(19, 375, context),),
                          bodyText('Volume',bodyFontSize: 16),
                        ],
                      ),
                      SizedBox(height: size.getResizeAbleHeight(9, 812, context),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: size.getResizeAbleWidth(12, 375, context),),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              VolumeData(orientation: 'Left', data: 25.40,isColorWhite: true,),
                              SizedBox(width: size.getResizeAbleWidth(9, 375, context),),
                              VolumeData(orientation: 'Right', data: 30.02,isColorWhite: true,),
                              SizedBox(width: size.getResizeAbleWidth(9, 375, context),),
                              VolumeData(orientation: 'Total', data: 55.42,isColorWhite: false,),
                            ],
                          ),
                          SizedBox(width: size.getResizeAbleWidth(12, 375, context),)
                        ],
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
      designSize: const Size(393.0, 852.0),
    );
  }
}


