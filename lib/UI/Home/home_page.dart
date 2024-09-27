import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/show_data_with_icons.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/show_data_with_unit.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/avatar.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/ReUseAble/network_image.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_cubit.dart';

class HomePage extends StatefulWidget {
  final HomeCubit cubit;
  // final UserDeInitialParams initialParams;
  const HomePage({Key? key, required this.cubit}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeCubit get cubit => widget.cubit;

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(HomeInitialParams());
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ListTile(
                //   leading: reUseAbleOnlineImage('',height: MediaQuery.of(context).size.height*(48/812) , width: MediaQuery.of(context).size.width*(48/343) ),
                //   title: bodyText('Have a good day!',bodyFontSize: 14,bodyTextFontWeight: FontWeight.w400),
                //   trailing: bodyText(''),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image(image: reUseAbleOnlineImage('https://fastly.picsum.photos/id/392/200/300.jpg?hmac=tcnub3WKREnSOdoCn7rQtfZkHXNWn5fXwNpHrv0o-5k')),
                    reUseAbleOnlineImage('https://fastly.picsum.photos/id/387/48/48.jpg?hmac=YWsF-uptepsYcyZbDy81__aoanj2NihNRvnNNJ-PSmM'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bodyText('Have a good day!',bodyFontSize: 14,bodyTextFontWeight: FontWeight.w400),
                        headingText('Olivia Brown',color: Color(0xFF222222),fontSize: 19),
                      ],
                    ),
                    ReUseAbleSvg(path: ImageConstants.optionButton)

                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width*(157/375),
                      // height: MediaQuery.of(context).size.height*(178/812),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // ReUseAbleSvg(path: ImageConstants.connectPump,
                          //   // height: MediaQuery.of(context).size.height*(124/812),
                          //   // width: MediaQuery.of(context).size.width*(124/375),
                          // ),
                          AssetsImages(path: 'assets/Chart.png',
                            width: MediaQuery.of(context).size.width*(124/375),
                            height: MediaQuery.of(context).size.height*(124/812),
                            // height: MediaQuery.of(context).size.height*(130/812),
                            // width: MediaQuery.of(context).size.width*(130/375),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*(12/812),
                          ),
                          showDataWithUnit(55.42, 'oz'),

                          bodyText('This Week',bodyFontSize: 16)
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width*(157/375),
                      child: Column(
                        children: [
                          // ReUseAbleSvg(path: ImageConstants.connectPump,
                          //   // height: MediaQuery.of(context).size.height*(124/812),
                          //   // width: MediaQuery.of(context).size.width*(124/375),
                          // ),
                          AssetsImages(path: ImageConstants.connectPump,

                          ),
                          bodyText('Not Connect',bodyFontSize: 16,bodyTextFontWeight: FontWeight.w400,bodyTextHeight: 1),
                          SizedBox(height: MediaQuery.of(context).size.height*(9/812),),
                          StyledButton(
                            text: 'Connect Pump',
                            onTap: (){},
                            backgroundColor: Color(0xFFB2CBF2),
                            textColor: Colors.white,
                            height: MediaQuery.of(context).size.height*(33/812),
                            width: MediaQuery.of(context).size.width*(137/375),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
                // SizedBox(height: MediaQuery.of(context).size.height*(20/812),),
                Container(
                  height: MediaQuery.of(context).size.height*(98/812),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bodyText('Best Day of the week',bodyFontSize: 16,bodyTextFontWeight: FontWeight.w400),
                          showDataWithUnit(33.19, 'oz')
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReUseAbleSvg(path: ImageConstants.drop),
                          bodyText('Thursday, 25 July',bodyFontSize: 14,bodyTextFontWeight: FontWeight.w400)
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*(20/812),),

                Stack(
                  children: [
                    ReUseAbleSvg(path: ImageConstants.pulseWeightBar),
                    Row(
                      children: [
                        showDataWithIcons(78, 'BPM', 'Pulse', ImageConstants.pulseIcon, context),
                        showDataWithIcons(64, 'Kg', 'Weight', ImageConstants.weight, context),
                      ],
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: AssetsImages(path: ImageConstants.editPulse,
                          height: MediaQuery.of(context).size.height * (48/812),
                          width: MediaQuery.of(context).size.width * (48/375),
                        )
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headingText('Recent Sessions',fontSize: 22),
                    bodyText('Show all',bodyFontSize: 14)
                  ],
                ),

                bodyText('This Week',bodyFontSize: 14, bodyTextFontWeight: FontWeight.w400),

                Expanded(
                  child: ListView.builder(
                      // physics: ScrollPhysics(),
                      // shrinkWrap: true,
                      itemCount:18,
                      itemBuilder: (context,index){
                        return ListTile(
                          leading: ReUseAbleSvg(path: ImageConstants.dropBackgorund),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              bodyText('Thursday at 8:00 AM'),
                              bodyText('35 min')
                            ],
                          ),
                          trailing: lightBlueText(33.19, ' oz'),
                        );
                      }),
                ),


              ],
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*(90/812),
                  width: MediaQuery.of(context).size.width*(343/375),
                  // padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  // margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //         color: Colors.black
                  //     )
                  // ),
                  child: ReUseAbleSvg(path: ImageConstants.bottomRectangle,width: MediaQuery.of(context).size.width*(343/375),height: MediaQuery.of(context).size.height*(102/812),),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*(90/812),
                  width: MediaQuery.of(context).size.width*(343/375),
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  // margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //         color: Colors.black
                  //     )
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*(44/812),),
                          ReUseAbleSvg(path: ImageConstants.home2,height: 24,width: 24,),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*(44/812),),
                          ReUseAbleSvg(path: ImageConstants.pieChart2),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*(8.5/812),),
                          ReUseAbleSvg(path: ImageConstants.pumpIcon,height: 56,width: 56,),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*(44/812),),
                          ReUseAbleSvg(path: ImageConstants.book2),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*(44/812),),
                          ReUseAbleSvg(path: ImageConstants.setting2),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          //TODO: Create a ReUseAble widget of it
          // bottomNavigationBar: Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Stack(
          //     children: [
          //       SizedBox(
          //         height: MediaQuery.of(context).size.height*(90/812),
          //         width: MediaQuery.of(context).size.width*(343/375),
          //         // padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          //         // margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
          //         // decoration: BoxDecoration(
          //         //     border: Border.all(
          //         //         color: Colors.black
          //         //     )
          //         // ),
          //         child: ReUseAbleSvg(path: ImageConstants.bottomRectangle,width: MediaQuery.of(context).size.width*(343/375),height: MediaQuery.of(context).size.height*(102/812),),
          //       ),
          //       Container(
          //         height: MediaQuery.of(context).size.height*(90/812),
          //         width: MediaQuery.of(context).size.width*(343/375),
          //         padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          //         // margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
          //         // decoration: BoxDecoration(
          //         //     border: Border.all(
          //         //         color: Colors.black
          //         //     )
          //         // ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           // crossAxisAlignment: CrossAxisAlignment.end,
          //           children: [
          //             Column(
          //               children: [
          //                 SizedBox(height: MediaQuery.of(context).size.height*(44/812),),
          //                 ReUseAbleSvg(path: ImageConstants.home2,height: 24,width: 24,),
          //               ],
          //             ),
          //             Column(
          //               children: [
          //                 SizedBox(height: MediaQuery.of(context).size.height*(44/812),),
          //                 ReUseAbleSvg(path: ImageConstants.pieChart2),
          //               ],
          //             ),
          //             Column(
          //               children: [
          //                 SizedBox(height: MediaQuery.of(context).size.height*(8.5/812),),
          //                 ReUseAbleSvg(path: ImageConstants.pumpIcon,height: 56,width: 56,),
          //               ],
          //             ),
          //             Column(
          //               children: [
          //                 SizedBox(height: MediaQuery.of(context).size.height*(44/812),),
          //                 ReUseAbleSvg(path: ImageConstants.book2),
          //               ],
          //             ),
          //             Column(
          //               children: [
          //                 SizedBox(height: MediaQuery.of(context).size.height*(44/812),),
          //                 ReUseAbleSvg(path: ImageConstants.setting2),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
      designSize: const Size(375.0, 812.0),
    );
  }
}
