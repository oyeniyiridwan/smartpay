import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class OnBoardingViewModel extends BaseViewModel {
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  int currentIndex = 0;
  onPageChanged(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    currentIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    debugPrint("all disposed");
    super.dispose();
  }
}
