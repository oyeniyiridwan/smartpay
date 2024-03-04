import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PasswordRecoveryViewModel extends BaseViewModel {
  int currentIndex = 0;
  bool obscureNew = true;
  bool obscureConfirm = true;

  PageController controller = PageController(initialPage: 0, keepPage: true);

  void switchObscureNew() {
    obscureNew = !obscureNew;
    notifyListeners();
  }

  void switchObscureConfirm() {
    obscureConfirm = !obscureConfirm;
    notifyListeners();
  }

  void onPageChange(int newIndex) {
    if (currentIndex < 2) {
      controller.animateToPage(newIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInToLinear);
      currentIndex = newIndex;
      notifyListeners();
    }
  }

  // void previousIndex() {
  //   if (currentIndex > 0) {
  //     currentIndex -= 1;
  //     notifyListeners();
  //   } else {
  //     navigationService.back();
  //   }
  // }
}
