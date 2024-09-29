import 'package:cuddle_care/UI/Session%20Options/session_options_initial_params.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_navigator.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_state.dart';
import 'package:cuddle_care/UI/Session%20Start/session_start_initial_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionOptionsCubit extends Cubit<SessionOptionsState> {
 final SessionOptionsInitialParams initialParams;
 final SessionOptionsNavigator navigator;
 SessionOptionsCubit(
     this.initialParams,
     this.navigator
     ) : super(SessionOptionsState.initial(initialParams: initialParams));


void onInit(SessionOptionsInitialParams initialParams) => emit(state.copyWith());

  void setDuration(int index) {
    emit(state.copyWith(duration: '' ,durationIndex: index));
  }


  void stopSession() {
    navigator.openSessionStartPage(SessionStartInitialParams());
  }
}
