

import 'package:flutter/material.dart';

class ShowHints extends ChangeNotifier {
  bool showHints = false;

  void toggleHintsState(bool value) {
    showHints = value;
    notifyListeners();
  }

  bool getHintsState() => showHints;
}