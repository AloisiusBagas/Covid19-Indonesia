import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debouncer {
  const Debouncer();

  run(VoidCallback action) {
    Timer _timer;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: 1500), action);
  }
}
