import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/app/app.logger.dart';
import 'package:smart_pay/app/app.router.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/services/api_services/api_extensions/api_service_extension.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/db_constants.dart';
import 'package:smart_pay/utils/enums.dart';
import 'package:smart_pay/utils/utilities.dart';
import 'package:stacked/stacked.dart';
import 'package:smart_pay/ui/auth/auth_view.form.dart';

class AuthViewModel extends FormViewModel {
  bool obscure = true;
  int currentIndex = 0;
  GlobalKey formKey = GlobalKey();
  bool get validEmail => emailValid('${emailValue}');
  bool get validEmailAndPassword => hasPassword && hasEmail;
  bool get requiredPinLength => hasPin ? pinValue!.length == 5 : false;
  Timer? timer;
  String timeLeft = '';
  Duration _duration = Duration(seconds: 60);
  Duration get duration => _duration;

  final log = getLogger('pin at work');
  void switchObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  void init(int? index) {
    currentIndex = index ?? 0;
    notifyListeners();
  }

  void switchPage() {
    if (currentIndex == 0) {
      currentIndex = 1;
    } else {
      currentIndex = 0;
    }
    notifyListeners();
  }

  Future getEmailToken({String? email, bool resend = false}) async {
    if (validEmail || emailValid(email!)) {
      try {
        setBusy(true);
        var response = await apiService.getEmailToken(
            email: hasEmail ? emailValue!.trim() : email!);

        setBusy(false);
        if (response != null) {
          final responseData = response.data['data'];
          snackBarService.showCustomSnackBar(
              message: 'token:   ${responseData['token']}',
              messageTextStyle: AppStyles.secondaryTextBold(17.sp),
              duration: Duration(seconds: 4),
              variant: SnackBarType.success);
          if (!resend) {
            navigationService.navigateToVerifyIdentitySignUp(
                email: emailValue!.trim());
          }
          if (!resend) {
            clearForm();
          }
        }
      } catch (e) {
        setBusy(false);

        snackBarService.showCustomSnackBar(
            message: 'Too many attempts', variant: SnackBarType.failure);
      }
    } else {
      snackBarService.showCustomSnackBar(
          message: 'Email is not Valid', variant: SnackBarType.failure);
    }
  }

  Future<void> verifyEmailToken(String email) async {
    log.d(email);
    if (hasPin) {
      if (pinValue!.length == 5) {
        try {
          setBusy(true);
          var response =
              await apiService.verifyEmailToken(email: email, token: pinValue!);
          setBusy(false);
          if (response != null) {
            snackBarService.showCustomSnackBar(
                message: 'token  verified successfully',
                messageTextStyle: AppStyles.secondaryTextBold(17.sp),
                duration: Duration(seconds: 2),
                variant: SnackBarType.success);
            navigationService.replaceWithRegisterView(email: email);
            clearForm();
          }
        } catch (e) {
          setBusy(false);
          snackBarService.showCustomSnackBar(
              message: 'Incorrect pin', variant: SnackBarType.failure);
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

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setCountDown();
      notifyListeners();
    });
  }

  void setCountDown() {
    final newSeconds = _duration.inSeconds - 1;
    if (newSeconds < 0) {
      timer!.cancel();
    } else {
      _duration = Duration(seconds: newSeconds);
    }
    notifyListeners();
  }

  void resetTimer() {
    timer!.cancel();
    _duration = Duration(seconds: 60);
    notifyListeners();
  }

  Future<void> Login() async {
    if (emailValid(emailValue!.trim()) &&
        isValidPassword(passwordValue!.trim())) {
      try {
        setBusy(true);
        var response = await apiService.Login(
          email: emailValue!.trim(),
          password: passwordValue!.trim(),
        );
        setBusy(false);
        if (response != null) {
          final responseData = response.data['data'];
          await sharedPreferencesService.setBool(keyIsFirstTime, false);
          snackBarService.showCustomSnackBar(
              message: 'Successfully Logged In',
              messageTextStyle: AppStyles.secondaryTextBold(17.sp),
              duration: Duration(seconds: 2),
              variant: SnackBarType.success);
          await sharedPreferencesService.setString(
              keyToken, responseData['token']);
          await sharedPreferencesService.setString(
              keyUserId, responseData['user']['id']);
          responseData['user']
              .putIfAbsent('password', () => passwordValue!.trim());
          await sharedPreferencesService.setMap(
              keyUserDetails, responseData['user']);
          navigationService.navigateToSetPinView(login: true);
          clearForm();
        }
      } catch (e) {
        setBusy(false);
        snackBarService.showCustomSnackBar(
            message: 'wrong password', variant: SnackBarType.failure);
      }
    } else {
      snackBarService.showCustomSnackBar(
          message: 'Pls supply required parameters',
          variant: SnackBarType.failure);
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
