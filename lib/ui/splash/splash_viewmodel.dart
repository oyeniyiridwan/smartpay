import 'dart:async';

import 'package:smart_pay/app/app.router.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/utils/constants/db_constants.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  Timer? _timer;
  void init() async {
    _timer = Timer(Duration(seconds: 2), () {
      navigate();
    });
  }

  Future<void> navigate() async {
    bool isFirstTime =
        await sharedPreferencesService.getBool(keyIsFirstTime) ?? true;
    if (isFirstTime) {
      await navigationService.replaceWithOnBoardingView();
    } else {
      String? pinCreated =
          await sharedPreferencesService.getString(keyLoginPin);
      if (pinCreated != null) {
        navigationService.replaceWithPinLoginView();
      } else {
        await navigationService.replaceWithAuthView(index: isFirstTime ? 0 : 1);
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
