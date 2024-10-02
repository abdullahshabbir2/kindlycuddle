import 'package:cuddle_care/Navigation/app_navigator.dart';
import 'package:cuddle_care/UI/Stats/stats_page.dart';
import 'package:cuddle_care/main.dart';
import 'package:flutter/material.dart';

import 'stats_initial_params.dart';


class StatsNavigator with StatsRoute{
  StatsNavigator(this.navigator);
  @override
  // TODO: implement context
  late BuildContext  context;

  @override
  // TODO: implement navigator
  AppNavigator navigator;

}

mixin StatsRoute{
  openStatsPage(StatsInitialParams initialParams)
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => StatsPage(cubit: getIt(param1: initialParams),))
    );
  }
  BuildContext get context;
  AppNavigator get navigator;
}