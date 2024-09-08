import 'package:cuddle_care/UI/SignIn/sign_in_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_navigator.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
 final SignInInitialParams initialParams;
 final SignInNavigator navigator;
 SignInCubit(
     this.initialParams,
     this.navigator
     ) : super(SignInState.initial(initialParams: initialParams));

void onInit(SignInInitialParams initialParams) => emit(state.copyWith());

}
