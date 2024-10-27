import 'package:cuddle_care/UI/Stats/stats_navigator.dart';
import 'package:cuddle_care/UI/Stats/stats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'stats_initial_params.dart';


class StatsCubit extends Cubit<StatsState> {
 final StatsInitialParams initialParams;
 final StatsNavigator navigator;
 StatsCubit(
     this.initialParams,
     this.navigator
     ) : super(StatsState.initial(initialParams: initialParams));


void onInit(StatsInitialParams initialParams) => emit(state.copyWith());

}
