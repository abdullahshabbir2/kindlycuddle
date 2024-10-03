import 'Profile_initial_params.dart';

class ProfileState {
  final bool isButtonOn;

  ProfileState({
    required this.isButtonOn
});

  factory ProfileState.initial({required ProfileInitialParams initialParams}) =>
      ProfileState(
        isButtonOn: true
  );

  ProfileState copyWith({
    bool? isButtonOn
}) =>
      ProfileState(
        isButtonOn: isButtonOn ?? this.isButtonOn
      );
}