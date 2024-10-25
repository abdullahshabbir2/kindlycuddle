
import 'session_options_initial_params.dart';

class SessionOptionsState {
  final String duration;
  final int durationIndex;
  SessionOptionsState({
    required this.duration,
    required this.durationIndex
});

  factory SessionOptionsState.initial({required SessionOptionsInitialParams initialParams}) =>
      SessionOptionsState(
        duration: '5 min',
        durationIndex: 0
  );

  SessionOptionsState copyWith({
    String? duration,
    int? durationIndex,
}) =>
      SessionOptionsState(
        duration: duration ?? this.duration,
        durationIndex: durationIndex ?? this.durationIndex
      );
}