import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/Service/Firebase/firebase_notification_service.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_page.dart';
import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/blurred_row.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/input_screen.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/list_data.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/pump_connection_card.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/show_data_with_icons.dart';
import 'package:cuddle_care/UI/Home/ReUseAble/this_week_data.dart';
import 'package:cuddle_care/UI/Home/home_state.dart';
import 'package:cuddle_care/UI/Profile/Profile_initial_params.dart';
import 'package:cuddle_care/UI/Profile/profile_page.dart';
import 'package:cuddle_care/UI/ReUseAble/blurred_screen.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/bottom_navigator.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/ReUseAble/rounded_image.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_initial_params.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_page.dart';
import 'package:cuddle_care/UI/Stats/stats_initial_params.dart';
import 'package:cuddle_care/UI/Stats/stats_page.dart';
import 'package:cuddle_care/UI/User%20Guide/user_guide1_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/user_guide1_page.dart';
import 'package:cuddle_care/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_notifier.dart';
import 'home_cubit.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class HomePage extends StatefulWidget {
  final HomeCubit cubit;
  // final UserDeInitialParams initialParams;
  final BluetoothDevice? device;
  const HomePage({Key? key, required this.cubit, this.device})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit get cubit => widget.cubit;

  //FirebaseNotificationService service = FirebaseNotificationService();

  int page = 0;

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(HomeInitialParams());
    cubit.navigator.context = context;

    cubit.getProfileData();
  }

  getWidget(int index) {
    debugPrint(index.toString());
    if (index == 1) {
      return StatsColumn(
        cubit: getIt(param1: StatsInitialParams()),
      );
    } else if (index == 2) {
      // cubit.moveToSessionOptions();
      return SessionOptionsPage(
          cubit: getIt(param1: SessionOptionsInitialParams()));
    } else if (index == 3) {
      cubit.setBottomNavbartoFalse();
      return UserGuide1Page(cubit: getIt(param1: UserGuide1InitialParams()));
    } else if (index == 4) {
      return ProfilePage(cubit: getIt(param1: ProfileInitialParams()));
    } else {
      return HomeColumn(cubit: cubit, device: widget.device);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                state as HomeState;
                debugPrint('I am in Home Page BlocBuilder');
                return getWidget(state.index);
              }),
          floatingActionButton: BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                state as HomeState;
                debugPrint(state.index.toString());

                return Visibility(
                  visible: state.showBottomNavbar,
                  child: MyBottomNavigator(
                    index: state.index,
                    onTap: (index) {
                      cubit.setIndex(index);
                    },
                  ),
                );
              }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
      designSize: const Size(375.0, 812.0),
    );
  }
}

class HomeColumn extends StatefulWidget {
  final HomeCubit cubit;
  final BluetoothDevice? device;
  const HomeColumn({super.key, required this.cubit, this.device});

  @override
  State<HomeColumn> createState() => _HomeColumnState();
}

class _HomeColumnState extends State<HomeColumn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.cubit.getPulseWeight();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    final String imagePath = _themeNotifier.isDarkMode
        ? ImageConstants.pulseWeightBarDark
        : ImageConstants.pulseWeightBar;
    bool isDarkMode = _themeNotifier.isDarkMode;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<HomeCubit, HomeState>(
                      bloc: widget.cubit,
                      builder: (context, state) {
                        state;

                        // Ensure the profile image is not null or empty
                        String? profileImage =
                            state.profile.image?.isNotEmpty == true
                                ? state.profile.image
                                : FirebaseAuth.instance.currentUser?.photoURL;

                        // If no image from state or Firebase, use a default placeholder
                        profileImage ??=
                            'https://www.gravatar.com/avatar/placeholder?s=200&d=mp';

                        debugPrint("Profile Image URL: $profileImage");

                        return roundedImage(profileImage);
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bodyText('Have a good day!',
                            bodyFontSize: 14,
                            bodyTextFontWeight: FontWeight.w400),
                        BlocBuilder(
                            bloc: widget.cubit,
                            builder: (context, state) {
                              state as HomeState;
                              return headingText(
                                  state.profile.name ?? 'Where is it',
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 19);
                            }),
                      ],
                    ),
                    ReUseAbleSvg(
                        path: isDarkMode
                            ? ImageConstants.optionButtonDark
                            : ImageConstants.optionButton)
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ThisWeekData(
                      minutes: 30,
                      second: 55,
                    ),
                    PumpConnectionCard(
                      device: widget.device,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchingDevicesPage(
                              cubit: getIt(
                                  param1: SearchingDevicesInitialParams()),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (98 / 812),
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(240, 235, 255,
                                  0.5), // rgba(240, 235, 255, 0.5)
                              Color.fromRGBO(255, 255, 255,
                                  0.31) // rgba(255, 255, 255, 0.31)
                            ],
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50.0, // Set width of the circle
                                height: 50.0, // Set height of the circle
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary, // Background color
                                  shape: BoxShape
                                      .circle, // Makes the container a circle
                                ),
                              ),
                              Container(
                                width: 50.0, // Set width of the circle
                                height: 50.0, // Set height of the circle
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary, // Background color
                                  shape: BoxShape
                                      .circle, // Makes the container a circle
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const BlurredRow(
                            title: 'Best Day of the week',
                            minutes: 33,
                            second: 44,
                            date: 'Thursday, 25 July',
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .transparent, // Set to transparent to only show the shadow
                          boxShadow: [
                            BoxShadow(
                              color: isDarkMode
                                  ? Colors.transparent
                                  : const Color.fromRGBO(208, 226, 246,
                                      1), // Shadow color with opacity
                              offset: const Offset(0,
                                  16), // Horizontal: 0, Vertical: 4 (bottom shadow)
                              blurRadius: 20, // Blur radius for the shadow
                              spreadRadius: -15, // Spread radius for the shadow
                            ),
                          ],
                        ),
                        child: Transform.scale(
                            scaleX: 1.1, child: ReUseAbleSvg(path: imagePath)),
                      ),
                      BlocBuilder(
                          bloc: widget.cubit,
                          builder: (context, state) {
                            state as HomeState;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                showDataWithIcons(state.pulse.toDouble(), 'BPM',
                                    'Pulse', ImageConstants.pulseIcon, context),
                                showDataWithIcons(state.weight.toDouble(), 'Kg',
                                    'Weight', ImageConstants.weight, context),
                              ],
                            );
                          }),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: InkWell(
                            onTap: () {
                              widget.cubit.editPulseWeight();
                            },
                            child: Transform.scale(
                              scale: 0.8,
                              child: SvgPicture.asset(
                                isDarkMode
                                    ? ImageConstants.editPulseSvgDark
                                    : ImageConstants.editPulseSvg,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headingText('Recent Sessions',
                        fontSize: 22,
                        color: Theme.of(context).colorScheme.primary),
                    bodyText('Show all', bodyFontSize: 14)
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                bodyText('This Week',
                    bodyFontSize: 14, bodyTextFontWeight: FontWeight.w400),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                BlurredListView(
                  itemCount: 18,
                  isDarkMode: Theme.of(context).brightness == Brightness.dark,
                )
              ],
            ),
            BlocBuilder(
                bloc: widget.cubit,
                builder: (context, state) {
                  state as HomeState;
                  // if(state.showContainer) {
                  return BlurredScreen(
                      displayBlurredScreen: state.showBlurredVision);
                }),
            BlocBuilder(
                bloc: widget.cubit,
                builder: (context, state) {
                  state as HomeState;
                  // if(state.showContainer) {
                  return InputScreen(
                    isVisible: state.showBlurredVision,
                    setPulseWeight: (pulse, weight) {
                      widget.cubit.setPulseWeight(pulse, weight);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
