import 'Home_initial_params.dart';

class HomeState {
  final int index;
  final bool showBlurredVision;

  final double pulse;

  final double weight;

  final bool showBottomNavbar;
  HomeState({
    required this.index,
    required this.showBlurredVision,
    required this.pulse,
    required this.weight,
    required this.showBottomNavbar
});

  factory HomeState.initial({required HomeInitialParams initialParams}) =>
      HomeState(
        index: 0,
        showBlurredVision: false,
        pulse: 0,
        weight: 0,
        showBottomNavbar: true
  );

  HomeState copyWith({
    int? index,
    bool? showBlurredVision,
    double? pulse,
    double? weight,
    bool? showBottomNavbar
  }) =>
      HomeState(
        index: index ?? this.index,
        showBlurredVision: showBlurredVision ?? this.showBlurredVision,
        pulse: pulse ?? this.pulse,
        weight: weight ?? this.weight,
        showBottomNavbar: showBottomNavbar ?? this.showBottomNavbar
      );
}