import 'package:cuddle_care/UI/Session%20Start/session_start_initial_params.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_state.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%201/user_guide1_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'session_start_navigator.dart';

class SessionStartCubit extends Cubit<SessionStartState> {
 final SessionStartInitialParams initialParams;
 final SessionStartNavigator navigator;
 SessionStartCubit(
     this.initialParams,
     this.navigator
     ) : super(SessionStartState.initial(initialParams: initialParams));

void onInit(SessionStartInitialParams initialParams) => emit(state.copyWith());

void moveToUserGuide1(){
 navigator.openUserGuide1Page(UserGuide1InitialParams());
}

  void setTimePassed(int ticks) {
  int minutes = getMinutes(ticks);
  int seconds = getSeconds(ticks);
  emit(state.copyWith(minutesPassed:minutes , secondsPassed: seconds ));
  }

  void setTimeRemaining(int ticks) {
    int minutes = getMinutes(ticks);
    int seconds = getSeconds(ticks);
    emit(state.copyWith(minutesLeft:minutes , secondsLeft: seconds ));
  }

  getMinutes(int ticks){
  double num = ticks/60;
  return num.toInt() ;
  }

  int getSeconds(int ticks) {
  return ticks%60;
  }

  void setTotalTime(int ticks) {
    int minutes = getMinutes(ticks);
    int seconds = getSeconds(ticks);
    emit(state.copyWith(minutesTotal:minutes , secondsTotal: seconds ));
  }

}
