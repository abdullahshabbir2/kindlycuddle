import 'dart:async';

class TimerController {


  Timer? _timer;
  int _elapsedTicks = 0; // Track how many intervals have passed
  final int _maxTicks = 60; // Number of 5-second intervals to reach 1 minute

  getElapsedTicks(){
    return _elapsedTicks;
  }



  int startTimer() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      _elapsedTicks++;
      performFunctionality();

      if (_elapsedTicks >= _maxTicks) {
        stopTimer(); // Stop the timer after 1 minute
      }
    });

    return _elapsedTicks;
  }

  void pauseTimer() {
    _timer?.cancel();
    _timer = null; // Set to null so it can be resumed later
  }

  void resumeTimer() {
    if (_timer == null && _elapsedTicks < _maxTicks) {
      startTimer(); // Restart the timer if it’s not running and time remains
    }
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    _elapsedTicks = 0; // Reset ticks for a fresh start if needed
  }

  performFunctionality() {
    print("Functionality performed at: ${DateTime.now()}");
    // getElapsedTicks();
  }
}