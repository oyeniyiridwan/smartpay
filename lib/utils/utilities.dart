import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:smart_pay/utils/enums.dart';

class PinThemes {
  static final defaultPinTheme = PinTheme(
    width: 56.w,
    height: 48.h,
    textStyle: TextStyle(
      fontSize: 19.sp,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w700,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(8.r),
    ),
  );

  static final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: AppColors.secondaryColor),
  );
}

showSnackBar({required String message, Enum variant = SnackBarType.success}) {
  snackBarService.showCustomSnackBar(
    message: message,
    variant: variant,
    duration: const Duration(seconds: 2),
  );
}

bool emailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

bool isValidName(String name) {
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  return letterReg.hasMatch(name);
}

bool isValidPassword(password) {
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  return numReg.hasMatch(password) && letterReg.hasMatch(password);
}

String hideEmail(String email) {
  var nameUser = email.split('@');
  return email.replaceRange(0, nameUser[0].length, '*' * (nameUser[0].length));
}
