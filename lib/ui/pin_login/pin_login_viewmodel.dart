import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/app/app.logger.dart';
import 'package:smart_pay/app/app.router.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/services/api_services/api_extensions/api_service_extension.dart';
import 'package:smart_pay/ui/pin_login/pin_login_view.form.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/db_constants.dart';
import 'package:smart_pay/utils/enums.dart';
import 'package:stacked/stacked.dart';

class PinViewLoginModel extends FormViewModel {
  final log = getLogger('pin at work');
  bool get requiredPinLength => hasPin ? pinValue!.length == 5 : false;

  void loginPin() async {
    if (hasPin) {
      if (pinValue!.length == 5) {
        String? savedPin = sharedPreferencesService.getString(keyLoginPin);

        if (pinValue == savedPin) {
          Map map = await sharedPreferencesService.getMap(keyUserDetails);
          debugPrint(map.toString());
          String email = map['email'];
          String password = map['password'];
          try {
            setBusy(true);
            var response = await apiService.Login(
              email: email,
              password: password,
            );
            setBusy(false);
            if (response != null) {
              clearForm();
              final responseData = response.data['data'];
              snackBarService.showCustomSnackBar(
                  message: 'Successfully Logged In',
                  messageTextStyle: AppStyles.secondaryTextBold(17.sp),
                  duration: Duration(seconds: 3),
                  variant: SnackBarType.success);
              await sharedPreferencesService.setString(
                  keyToken, responseData['token']);
              navigationService.navigateToDashBoardView();
            }
          } catch (e) {
            throw Exception(e);
          }
        } else {
          snackBarService.showCustomSnackBar(
              message: 'Invalid pin', variant: SnackBarType.failure);
        }
      } else {
        snackBarService.showCustomSnackBar(
            message: 'pin must be 5 in length', variant: SnackBarType.failure);
      }
    } else {
      snackBarService.showCustomSnackBar(
          message: 'pin cannot be empty', variant: SnackBarType.failure);
    }
  }

  void authLogin() {
    navigationService.navigateToAuthView(index: 1);
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
