
import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Domain/UseCase/get_pulse_weight_usecase.dart';
import 'package:cuddle_care/Domain/UseCase/set_pulse_weight_usecase.dart';
import 'package:cuddle_care/UI/ReUseAble/toast_message.dart';
import 'package:cuddle_care/UI/Session%20Options/session_options_initial_params.dart';
import 'package:cuddle_care/UI/User%20Guide/User%20Guide%202/user_guide2_initial_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Home_initial_params.dart';
import 'home_navigator.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
 final HomeInitialParams initialParams;
 final HomeNavigator navigator;
 final GetPulseWeightUseCase getPulseWeightUseCase;
 final SetPulseWeightUseCase setPulseWeightUseCase;
 HomeCubit(
     this.initialParams,
     this.navigator,
     this.getPulseWeightUseCase,
     this.setPulseWeightUseCase
     ) : super(HomeState.initial(initialParams: initialParams));

void onInit(HomeInitialParams initialParams) => emit(state.copyWith());

  void getPulseWeight(){
    getPulseWeightUseCase.execute().then(
            (value) => value.fold(
                    (l) {

                    },
                    (r) {
                      emit(state.copyWith(pulse: r.pulse , weight: r.weight));
                    }
            )
    );
  }

  void setIndex(int index) {
    emit(state.copyWith(index:index));
  }

  void moveToSessionOptions() {
    navigator.openSessionOptionsPage(SessionOptionsInitialParams());
  }

  void editPulseWeight() {
    emit(state.copyWith(showBlurredVision: true));
  }

  void setPulseWeight(double pulse,double weight) {
    emit(state.copyWith(pulse: pulse , weight: weight , showBlurredVision: false));
    setPulseWeightUseCase.execute(pulse, weight).then(
            (value) => value.fold(
                    (l) {
                      ToastMessage().showMessage(l.error, ColorsConstants.failureToastColor);
                    },
                    (r) {
                      ToastMessage().showMessage('Data set', ColorsConstants.successToastColor);
                    }
            )
    );
  }

  void moveToUserGuide() {
    navigator.openUserGuide2Page(UserGuide2InitialParams());
  }

  void setBottomNavbartoFalse() {
    emit(state.copyWith(showBottomNavbar: false));
  }

}
