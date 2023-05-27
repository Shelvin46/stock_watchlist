import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int seconds;
  Timer? _timer;

  Debouncer({required this.seconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: seconds), action);
  }
}