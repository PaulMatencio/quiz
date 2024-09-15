
import 'package:flutter/material.dart';

class ShowResponse extends ChangeNotifier {
  bool showResponse = false;
  void toggleResponseState(bool value) {
    showResponse = value;
    notifyListeners();
  }
  bool getResponseState() => showResponse;
}

