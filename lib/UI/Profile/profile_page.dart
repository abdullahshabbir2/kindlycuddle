import 'dart:ui';

import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/Profile/Profile_initial_params.dart';
import 'package:cuddle_care/UI/Profile/ReUseAble/info_modal_contact.dart';
import 'package:cuddle_care/UI/Profile/ReUseAble/info_modal_help.dart';
import 'package:cuddle_care/UI/Profile/ReUseAble/info_modal_privacy.dart';
import 'package:cuddle_care/UI/Profile/ReUseAble/profile_list_item.dart';
import 'package:cuddle_care/UI/Profile/ReUseAble/stacked_images.dart';
import 'package:cuddle_care/UI/Profile/profile_cubit.dart';
import 'package:cuddle_care/UI/Profile/profile_state.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/get_resizeable_size.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/light_blue_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  final ProfileCubit cubit;
  // final UserDeInitialParams initialParams;
  const ProfilePage({Key? key, required this.cubit}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileCubit get cubit => widget.cubit;
  // ReSizeAbleSize size = ReSizeAbleSize();

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(ProfileInitialParams());
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    // Widget showProfile() => Positioned(
    //   bottom: 0,
    //   child: Column(
    //     children: [
    //       ShowStackedImages( width: 116,height: 116,imageUrl: '', sideImage: ImageConstants.editIcon, profileAvailable: false,alignment: Alignment.bottomRight,),
    //       lightBlueText('Olivia Brown',height: 1),
    //       headingText('youremail@domain.com | +01 234 567 89',fontSize: 14)
    //     ],
    //   ),
    // );

    return ScreenUtilInit(
      builder: (BuildContext context, child) => const SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              // Stack(
              //   children: [
              //     ReUseAbleSvg(path: ImageConstants.mask,width: size.getResizeAbleWidth(375, 375, context),height: size.getResizeAbleHeight(193, 812, context),),
              //
              //     Padding(
              //       padding: const EdgeInsets.all(20.0),
              //       child: Column(
              //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Row(
              //             children: [
              //               headingText('My Profile',fontSize: 24),
              //             ],
              //           ),
              //           SizedBox(height: size.getResizeAbleHeight(66, 812, context),),
              //           showProfile(),
              //
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              //
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Column(
              //     children: [
              //       BlocBuilder(
              //         bloc:cubit,
              //         builder: (context , state) {
              //           state as ProfileState;
              //           return ListView(
              //             shrinkWrap: true,
              //             children: [
              //
              //
              //               ProfileListItem(imgPath: ImageConstants.volume, title: 'Volume Unit', trailing: bodyText('Oz')),
              //
              //               ProfileListItem(imgPath: ImageConstants.notification, title: 'Reminder Notifications', trailing: SizedBox(
              //                 height: size.getResizeAbleHeight(20, 812, context),
              //                 width: size.getResizeAbleWidth(40, 375, context),
              //                 child: Switch(
              //                     activeColor: Colors.blue,
              //                     value: state.isButtonOn,
              //                     onChanged: (value){
              //                       cubit.setButtonValue(value);
              //                     }
              //                 ),
              //               )),
              //
              //               ProfileListItem(imgPath: ImageConstants.appMode, title: 'App Mode', trailing: bodyText('Light')),
              //
              //               ProfileListItem(imgPath: ImageConstants.support, title: 'Help and Support',),
              //
              //               ProfileListItem(imgPath: ImageConstants.contact, title: 'Contact Us'),
              //
              //               ProfileListItem(imgPath: ImageConstants.privacyPolicy, title: 'Privacy Policy',),
              //             ],
              //           );
              //         }
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      designSize: const Size(375.0, 812.0),
    );
  }
}

class ProfileColumn extends StatefulWidget {
  final ProfileCubit cubit;
  const ProfileColumn({super.key, required this.cubit});

  @override
  State<ProfileColumn> createState() => _ProfileColumnState();
}

class _ProfileColumnState extends State<ProfileColumn> {
  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(ProfileInitialParams());
    cubit.navigator.context = context;

    cubit.getProfileData();
  }

  ProfileCubit get cubit => widget.cubit;
  ReSizeAbleSize size = ReSizeAbleSize();
  Widget showProfile() => BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        state as ProfileState;
        return Column(
          children: [
            ShowStackedImages(
              width: 116,
              height: 116,
              imageUrl: state.image,
              sideImage: ImageConstants.editIcon,
              profileAvailable: state.image.isNotEmpty,
              alignment: Alignment.bottomRight,
              onTap: () {
                cubit.pickImageFromGallery();
              },
            ),
            //   }
            // ),
            lightBlueText(state.profileDomain.name ?? '', height: 1),
            headingText('${state.profileDomain.email ?? ''} | +01 234 567 89',
                fontSize: 14)
          ],
        );
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ReUseAbleSvg(
              path: ImageConstants.mask,
              width: size.getResizeAbleWidth(375, 375, context),
              height: size.getResizeAbleHeight(193, 812, context),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      headingText('My Profile', fontSize: 24),
                    ],
                  ),
                  SizedBox(
                    height: size.getResizeAbleHeight(66, 812, context),
                  ),
                  showProfile(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.getResizeAbleHeight(30, 812, context),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    state as ProfileState;
                    return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ProfileListItem(
                          imgPath: ImageConstants.volume,
                          title: 'Volume Unit',
                          trailing: bodyText('Oz'),
                          onTap: () {},
                        ),
                        ProfileListItem(
                          imgPath: ImageConstants.notification,
                          title: 'Reminder Notifications',
                          trailing: SizedBox(
                            height: size.getResizeAbleHeight(20, 812, context),
                            width: size.getResizeAbleWidth(40, 375, context),
                            child: Switch(
                                activeColor: Colors.blue,
                                value: state.isButtonOn,
                                onChanged: (value) {
                                  cubit.setButtonValue(value);
                                }),
                          ),
                          onTap: () {},
                        ),
                        ProfileListItem(
                          imgPath: ImageConstants.appMode,
                          title: 'App Mode',
                          trailing: bodyText('Light'),
                          onTap: () {},
                        ),
                        ProfileListItem(
                          imgPath: ImageConstants.support,
                          title: 'Help and Support',
                          onTap: () {
                            showModalBottomSheet(
                              barrierColor: Colors.transparent,
                              context: context,
                              showDragHandle: true,
                              enableDrag: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.0)),
                              ),
                              isScrollControlled:
                                  true, // Allows full-height modal
                              builder: (BuildContext context) {
                                return BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child:
                                        const InfoModalHelp()); // Display the InfoModal
                              },
                            );
                          },
                        ),
                        ProfileListItem(
                          imgPath: ImageConstants.contact,
                          title: 'Contact Us',
                          onTap: () {
                            showModalBottomSheet(
                              barrierColor: Colors.transparent,
                              context: context,
                              showDragHandle: true,
                              enableDrag: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.0)),
                              ),
                              isScrollControlled:
                                  true, // Allows full-height modal
                              builder: (BuildContext context) {
                                return BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child:
                                        const InfoModalContact()); // Display the InfoModal
                              },
                            );
                          },
                        ),
                        ProfileListItem(
                          imgPath: ImageConstants.privacyPolicy,
                          title: 'Privacy Policy',
                          onTap: () {
                            showModalBottomSheet(
                              barrierColor: Colors.transparent,
                              context: context,
                              showDragHandle: true,
                              enableDrag: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.0)),
                              ),
                              isScrollControlled:
                                  true, // Allows full-height modal
                              builder: (BuildContext context) {
                                return BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child:
                                        const InfoModalPrivacy()); // Display the InfoModal
                              },
                            );
                          },
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
