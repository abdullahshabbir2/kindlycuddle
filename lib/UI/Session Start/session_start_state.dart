
import 'package:cuddle_care/UI/Session%20Start/session_start_initial_params.dart';

class SessionStartState {
  int minutesPassed;
  int secondsPassed;
  int minutesLeft;
  int secondsLeft;
  int minutesTotal;
  int secondsTotal;
  SessionStartState({
    required this.minutesPassed,
    required this.secondsPassed,
    required this.minutesLeft,
    required this.secondsLeft,
    required this.minutesTotal,
    required this.secondsTotal
});

  factory SessionStartState.initial({required SessionStartInitialParams initialParams}) =>
      SessionStartState(
        minutesPassed: 0,
        secondsPassed: 0,
        minutesLeft: 0,
        secondsLeft: 0,
        minutesTotal: 0,
        secondsTotal: 0
  );

  SessionStartState copyWith({
    int? minutesPassed,
    int? secondsPassed,
    int? minutesLeft,
    int? secondsLeft,
    int? minutesTotal,
    int? secondsTotal
  }) =>
      SessionStartState(
        minutesPassed: minutesPassed ?? this.minutesPassed,
        secondsPassed: secondsPassed ?? this.secondsPassed,
        minutesLeft: minutesLeft ?? this.minutesLeft,
        secondsLeft: secondsLeft ?? this.secondsLeft,
        minutesTotal: minutesTotal ?? this.minutesTotal,
        secondsTotal: secondsTotal ?? this.secondsTotal
      );
}