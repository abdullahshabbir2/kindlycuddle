import 'Home_initial_params.dart';

class HomeState {
  final int index;
  HomeState({
    required this.index
});

  factory HomeState.initial({required HomeInitialParams initialParams}) =>
      HomeState(
        index: 0
  );

  HomeState copyWith({
    int? index
  }) =>
      HomeState(
        index: index ?? this.index
      );
}