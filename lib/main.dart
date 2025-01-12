import 'package:cuddle_care/Constants/font_family_constants.dart';
import 'package:cuddle_care/Data/Repository/firebase_user_repository.dart';
import 'package:cuddle_care/Data/Repository/mock_blutooth_repository.dart';
import 'package:cuddle_care/Data/Repository/mock_user_repository.dart';
import 'package:cuddle_care/Data/Repository/shared_prerence_ble_data_repository.dart';
import 'package:cuddle_care/Domain/Repository/ble_data_repository.dart';
import 'package:cuddle_care/Domain/Repository/bluetooth_repository.dart';
import 'package:cuddle_care/Domain/Repository/user_repository.dart';
import 'package:cuddle_care/Domain/Store/bluetooth_device_store.dart';
import 'package:cuddle_care/Domain/Store/device_info_store.dart';
import 'package:cuddle_care/Domain/Store/user_id_store.dart';
import 'package:cuddle_care/Domain/UseCase/check_if_logged_in.dart';
import 'package:cuddle_care/Domain/UseCase/create_user_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/get_profile_data_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/get_pulse_weight_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/google_signUp_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/reset_password_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/search_for_devices_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/set_pulse_weight_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/sign_in_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/upload_image_usecase.dart';
import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/Service/Firebase/firebase_data_service.dart';
import 'package:cuddle_care/Service/Firebase/firebase_service.dart';
import 'package:cuddle_care/Service/Shared%20Preference%20Service/shared_preference_service.dart';
import 'package:cuddle_care/UI/Bluetooth/Bluetooth%20Permissions/bluetooth_permission_cubit.dart';
import 'package:cuddle_care/UI/Bluetooth/Bluetooth%20Permissions/bluetooth_permission_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Bluetooth%20Permissions/bluetooth_permission_navigator.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Connected%20Successfully/device_connected_successfully_cubit.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Connected%20Successfully/device_connected_successfully_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Connected%20Successfully/device_connected_successfully_navigator.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Pairing/device_pairing_cubit.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Pairing/device_pairing_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Device%20Pairing/device_pairing_navigator.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_cubit.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_initial_params.dart';
import 'package:cuddle_care/UI/Bluetooth/Searching%20Devices/searching_devices_navigator.dart';
import 'package:cuddle_care/UI/Home/Home_initial_params.dart';
import 'package:cuddle_care/UI/Home/home_cubit.dart';
import 'package:cuddle_care/UI/Home/home_navigator.dart';
import 'package:cuddle_care/UI/Home/home_page.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_cubit.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_initial_params.dart';
import 'package:cuddle_care/UI/OnBoarding/on_boarding_navigator.dart';
import 'package:cuddle_care/UI/Profile/Profile_initial_params.dart';
import 'package:cuddle_care/UI/Profile/profile_cubit.dart';
import 'package:cuddle_care/UI/Profile/profile_navigator.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_cubit.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_initial_params.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_navigator.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_cubit.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_initial_params.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_navigator.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_cubit.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_navigator.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_cubit.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_navigator.dart';
import 'package:cuddle_care/UI/Splash/Splash_initial_params.dart';
import 'package:cuddle_care/UI/Splash/splash_cubit.dart';
import 'package:cuddle_care/UI/Splash/splash_navigator.dart';
import 'package:cuddle_care/UI/Splash/splash_page.dart';
import 'package:cuddle_care/UI/Stats/stats_cubit.dart';
import 'package:cuddle_care/UI/Stats/stats_initial_params.dart';
import 'package:cuddle_care/UI/Stats/stats_navigator.dart';
import 'package:cuddle_care/UI/User%20Guide/user_guide1_cubit.dart';
import 'package:cuddle_care/UI/User%20Guide/user_guide1_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/user_guide1_navigator.dart';
import 'package:cuddle_care/theme_notifier.dart';
// import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_cubit.dart';
// import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_initial_params.dart';
// import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_navigator.dart';
// import 'package:cuddle_care/UI/User%20Guide/User%20Guide%203/user_guide3_navigator.dart';
// import 'package:cuddle_care/UI/User%20Guide/User%20Guide%204/user_guide4_cubit.dart';
// import 'package:cuddle_care/UI/User%20Guide/User%20Guide%205/user_guide5_navigator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// import 'UI/User Guide/User Guide 3/user_guide3_cubit.dart';
// import 'UI/User Guide/User Guide 3/user_guide3_initial_params.dart';
// import 'UI/User Guide/User Guide 4/user_guide4_initial_params.dart';
// import 'UI/User Guide/User Guide 4/user_guide4_navigator.dart';
// import 'UI/User Guide/User Guide 5/user_guide5_cubit.dart';
// import 'UI/User Guide/User Guide 5/user_guide5_initial_params.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';

var getIt = GetIt.instance;

void main() async {
// ...

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  getIt.registerSingleton<AppNavigator>(AppNavigator());

  // Service
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<FirebaseDataService>(FirebaseDataService());

  getIt.registerSingleton<SharedPreferenceService>(SharedPreferenceService());

  // Store
  getIt.registerSingleton<DeviceStore>(DeviceStore());
  getIt.registerSingleton<BluetoothDeviceStore>(BluetoothDeviceStore());
  getIt.registerSingleton<UserIdStore>(UserIdStore());

  // Repository
  // getIt.registerSingleton<UserRepository>(MockUserRepository());
  getIt.registerSingleton<UserRepository>(
      FirebaseUserRepository(getIt(), getIt(), getIt()));
  getIt.registerSingleton<BluetoothRepository>(MockBluetoothRepository());
  getIt.registerSingleton<BleDataRepository>(
      SharedPreferenceBleDataRepository(getIt()));

  // UseCase
  getIt.registerSingleton<CreateUserUseCase>(CreateUserUseCase(getIt()));
  getIt.registerSingleton<GoogleSignUpUseCase>(GoogleSignUpUseCase(getIt()));
  getIt.registerSingleton<SignInUseCase>(SignInUseCase(getIt()));
  getIt.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase(getIt()));
  getIt.registerSingleton<SearchForDevicesUseCase>(
      SearchForDevicesUseCase(getIt()));
  getIt
      .registerSingleton<GetPulseWeightUseCase>(GetPulseWeightUseCase(getIt()));
  getIt
      .registerSingleton<SetPulseWeightUseCase>(SetPulseWeightUseCase(getIt()));
  getIt.registerSingleton<UploadImageUseCase>(UploadImageUseCase(getIt()));
  getIt
      .registerSingleton<GetProfileDataUseCase>(GetProfileDataUseCase(getIt()));
  getIt.registerSingleton<CheckIfLoggedIn>(CheckIfLoggedIn(getIt()));

  getIt.registerSingleton<SplashNavigator>(SplashNavigator(getIt()));
  getIt.registerSingleton<OnBoardingNavigator>(OnBoardingNavigator(getIt()));
  getIt.registerSingleton<SignInNavigator>(SignInNavigator(getIt()));
  getIt.registerSingleton<SignUpNavigator>(SignUpNavigator(getIt()));
  getIt.registerSingleton<BluetoothPermissionNavigator>(
      BluetoothPermissionNavigator(getIt()));
  getIt.registerSingleton<SearchingDevicesNavigator>(
      SearchingDevicesNavigator(getIt()));
  getIt.registerSingleton<DevicePairingNavigator>(
      DevicePairingNavigator(getIt()));
  getIt.registerSingleton<DeviceConnectedSuccessfullyNavigator>(
      DeviceConnectedSuccessfullyNavigator(getIt()));
  getIt.registerSingleton<HomeNavigator>(HomeNavigator(getIt()));
  getIt.registerSingleton<StatsNavigator>(StatsNavigator(getIt()));
  getIt.registerSingleton<SessionOptionsNavigator>(
      SessionOptionsNavigator(getIt()));
  getIt
      .registerSingleton<SessionStartNavigator>(SessionStartNavigator(getIt()));
  getIt.registerSingleton<UserGuide1Navigator>(UserGuide1Navigator(getIt()));
  // getIt.registerSingleton<UserGuide2Navigator>(UserGuide2Navigator(getIt()));
  // getIt.registerSingleton<UserGuide3Navigator>(UserGuide3Navigator(getIt()));
  // getIt.registerSingleton<UserGuide4Navigator>(UserGuide4Navigator(getIt()));
  // getIt.registerSingleton<UserGuide5Navigator>(UserGuide5Navigator(getIt()));
  getIt.registerSingleton<ProfileNavigator>(ProfileNavigator(getIt()));

  getIt.registerFactoryParam<SplashCubit, SplashInitialParams, dynamic>(
      (params, _) => SplashCubit(
            params,
            getIt(),
          ));

  getIt.registerFactoryParam<OnBoardingCubit, OnBoardingInitialParams, dynamic>(
      (params, _) => OnBoardingCubit(
            params,
            getIt(),
            getIt(),
          ));

  getIt.registerFactoryParam<SignInCubit, SignInInitialParams, dynamic>(
      (params, _) =>
          SignInCubit(params, getIt(), getIt(), getIt(), getIt(), getIt()));

  getIt.registerFactoryParam<SignUpCubit, SignUpInitialParams, dynamic>(
      (params, _) =>
          SignUpCubit(params, getIt(), getIt(), getIt(), getIt(), getIt()));

  getIt.registerFactoryParam<
      BluetoothPermissionCubit,
      BluetoothPermissionInitialParams,
      dynamic>((params, _) => BluetoothPermissionCubit(params, getIt()));

  getIt.registerFactoryParam<SearchingDevicesCubit,
          SearchingDevicesInitialParams, dynamic>(
      (params, _) =>
          SearchingDevicesCubit(params, getIt(), getIt(), getIt(), getIt()));

  getIt.registerFactoryParam<DevicePairingCubit, DevicePairingInitialParams,
      dynamic>((params, _) => DevicePairingCubit(params, getIt(), getIt()));

  getIt.registerFactoryParam<DeviceConnectedSuccessfullyCubit,
          DeviceConnectedSuccessfullyInitialParams, dynamic>(
      (params, _) =>
          DeviceConnectedSuccessfullyCubit(params, getIt(), getIt()));

  getIt.registerFactoryParam<HomeCubit, HomeInitialParams, dynamic>(
      (params, _) =>
          HomeCubit(params, getIt(), getIt(), getIt(), getIt(), getIt()));

  getIt.registerFactoryParam<StatsCubit, StatsInitialParams, dynamic>(
      (params, _) => StatsCubit(params, getIt()));

  getIt.registerFactoryParam<SessionOptionsCubit, SessionOptionsInitialParams,
      dynamic>((params, _) => SessionOptionsCubit(params, getIt()));

  getIt.registerFactoryParam<SessionStartCubit, SessionStartInitialParams,
      dynamic>((params, _) => SessionStartCubit(params, getIt()));

  getIt.registerFactoryParam<UserGuide1Cubit, UserGuide1InitialParams, dynamic>(
      (params, _) => UserGuide1Cubit(params, getIt()));

  // getIt.registerFactoryParam<UserGuide2Cubit, UserGuide2InitialParams, dynamic>(
  //     (params, _) => UserGuide2Cubit(params, getIt()));

  // getIt.registerFactoryParam<UserGuide3Cubit, UserGuide3InitialParams, dynamic>(
  //     (params, _) => UserGuide3Cubit(params, getIt()));

  // getIt.registerFactoryParam<UserGuide4Cubit, UserGuide4InitialParams, dynamic>(
  //     (params, _) => UserGuide4Cubit(params, getIt()));

  // getIt.registerFactoryParam<UserGuide5Cubit, UserGuide5InitialParams, dynamic>(
  //     (params, _) => UserGuide5Cubit(params, getIt()));

  getIt.registerFactoryParam<ProfileCubit, ProfileInitialParams, dynamic>(
      (params, _) => ProfileCubit(params, getIt(), getIt(), getIt(), getIt()));

  // Request necessary permissions
  await requestPermissions();

  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

Future<void> requestPermissions() async {
  // Request Bluetooth and Location permissions
  if (await Permission.bluetooth.isDenied) {
    await Permission.bluetooth.request();
  }

  if (await Permission.bluetoothConnect.isDenied) {
    await Permission.bluetoothConnect.request();
  }

  if (await Permission.bluetoothScan.isDenied) {
    await Permission.bluetoothScan.request();
  }

  if (await Permission.location.isDenied) {
    await Permission.location.request();
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint(message.notification!.title.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          final scale = mediaQueryData.textScaler
              .clamp(minScaleFactor: 1.0, maxScaleFactor: 1.3);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: scale),
            child: child!,
          );
        },
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          fontFamily: FontFamilyConstants.fontFamilyConstant,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashPage(cubit: getIt(param1: SplashInitialParams())),
        routes: {
          '/home': (context) =>
              HomePage(cubit: getIt(param1: HomeInitialParams())),
        },
      );
    });
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
