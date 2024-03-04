import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/app/app.router.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/services/api_services/api_extensions/api_service_extension.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/db_constants.dart';
import 'package:smart_pay/utils/enums.dart';
import 'package:stacked/stacked.dart';

class DashBoardViewModel extends BaseViewModel {
  String content = '';
  String author = '';
  init() async {
    final response = await apiService.home();
    debugPrint(response.toString());
    final responseData = response!.data;
    final encryptedMessage = responseData['data']['secret'].split('-');
    debugPrint(encryptedMessage.toString());

    content = encryptedMessage[0];
    author = encryptedMessage[1];
    notifyListeners();
  }

  Future<void> LogOut() async {
    try {
      setBusy(true);
      var response = await apiService.LogOut();
      setBusy(false);
      if (response != null) {
        await sharedPreferencesService.clearData(keyToken);
        await sharedPreferencesService.clearData(keyLoginPin);
        await sharedPreferencesService.clearData(keyUserDetails);

        snackBarService.showCustomSnackBar(
            message: 'Successfully Logged Out',
            messageTextStyle: AppStyles.secondaryTextBold(17.sp),
            duration: Duration(seconds: 3),
            variant: SnackBarType.success);
        navigationService.clearTillFirstAndShow(Routes.authView,
            arguments: AuthViewArguments(index: 1));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
