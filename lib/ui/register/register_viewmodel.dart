import 'package:country_code_picker/src/country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/app/app.router.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/services/api_services/api_extensions/api_service_extension.dart';
import 'package:smart_pay/ui/register/register_view.form.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/db_constants.dart';
import 'package:smart_pay/utils/enums.dart';
import 'package:smart_pay/utils/utilities.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends FormViewModel {
  bool obscure = true;
  bool get readyToRegister => (hasUsername && hasPassword && hasFullName);

  switchObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  String? get countryName => countryDetails.name;
  CountryCode countryDetails = CountryCode.fromCountryCode('NG');

  onChange(CountryCode p1) {
    countryDetails = p1;
    notifyListeners();
  }

  Future<void> signUp(String email) async {
    if (isValidName(fullNameValue!.trim()) &&
        isValidPassword(passwordValue!.trim())) {
      debugPrint(countryName);

      try {
        setBusy(true);
        var response = await apiService.SignUp(
          email: email,
          fullName: fullNameValue!.trim(),
          username: usernameValue!.trim(),
          countryCode: '${countryDetails.code}',
          password: passwordValue!.trim(),
        );
        setBusy(false);
        if (response != null) {
          final responseData = response.data['data'];
          await sharedPreferencesService.setBool(keyIsFirstTime, false);
          snackBarService.showCustomSnackBar(
              message: 'Congratulations, You\'re Smart',
              messageTextStyle: AppStyles.secondaryTextBold(20.sp),
              duration: Duration(seconds: 5),
              variant: SnackBarType.success);
          await sharedPreferencesService.setString(
              keyToken, responseData['token']);
          await sharedPreferencesService.setString(
              keyUserId, responseData['user']['id']);
          navigationService.replaceWithSetPinView();
          clearForm();
        }
      } catch (e) {
        setBusy(false);
        snackBarService.showCustomSnackBar(
            message: 'password not secure or this mail is already registered',
            variant: SnackBarType.failure);
      }
    } else {
      snackBarService.showCustomSnackBar(
          message:
              'Pls supply valid${hasUsername ? '' : ' username,'}${hasFullName ? '' : ' fullname,'}${isValidPassword(passwordValue!.trim()) ? '' : ' password'}',
          variant: SnackBarType.failure);
    }
  }

  void clearFormData() {
    clearForm();
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
