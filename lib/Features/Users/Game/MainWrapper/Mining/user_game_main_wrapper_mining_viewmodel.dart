import 'dart:async';

import 'package:get/get.dart';

class UserGameMainWrapperMiningViewModel extends GetxController {
  var countdown = ''.obs;
  late Timer _timer;
  late Duration _duration;
  final Duration _maxDuration = const Duration(hours: 24);
  var power = 88.obs;


  @override
  void onInit() {
    super.onInit();
    _duration = const Duration(minutes: 15);
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds > 0) {
        _duration = _duration - const Duration(seconds: 1);
        countdown.value = formatDuration(_duration);
      } else {
        _timer.cancel();
      }
    });
  }

  void addTwoHours() {
    if (_duration + const Duration(hours: 2) <= _maxDuration) {
      _duration += const Duration(hours: 2);
    } else {
      _duration = _maxDuration;
    }
    _timer.cancel(); 
    startTimer();
    countdown.value = formatDuration(_duration);
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void updatePower(int newValue) {
    power.value = newValue;
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
