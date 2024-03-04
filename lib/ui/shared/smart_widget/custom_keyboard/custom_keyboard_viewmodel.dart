import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CustomKeyboardViewModel extends BaseViewModel {
  String pin = '';
  TextEditingController _controller = TextEditingController();
  init(TextEditingController controller) {
    _controller = controller;
    notifyListeners();
  }

  void deletePin() {
    if (pin.isNotEmpty) {
      pin = pin.substring(0, pin.length - 1);
      _controller.text = pin;
    }
    notifyListeners();
  }

  void updatePin(int index) {
    if (pin.length < 5) {
      if (index == 9) {
        pin = pin + '*';
      } else if (index == 10) {
        pin = pin + '0';
      } else if (index == 11) {
        deletePin();
      } else {
        pin = pin + (index + 1).toString();
      }
    } else if (index == 11) {
      deletePin();
    } else {
      return;
    }
    _controller.text = pin;
    notifyListeners();
    debugPrint('Pin: $pin');
    debugPrint('Pin Value: ${_controller.text}');
    debugPrint('Pin: $index pressed');
  }
}
