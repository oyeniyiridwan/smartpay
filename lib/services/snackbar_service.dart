import 'package:flutter/material.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:smart_pay/utils/enums.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackBar() {
  snackBarService.registerCustomSnackbarConfig(
    variant: SnackBarType.success,
    config: SnackbarConfig(
      padding: const EdgeInsets.symmetric(vertical: 10),
      backgroundColor: AppColors.whiteColor,
      titleTextAlign: TextAlign.right,
      icon: Icon(Icons.check),
      textColor: AppColors.whiteColor,
      borderRadius: 5,
      dismissDirection: DismissDirection.horizontal,
      margin: const EdgeInsets.only(top: 20, bottom: 0, right: 5, left: 5),
      barBlur: 0.6,
      messageColor: Colors.black,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
    ),
  );

  snackBarService.registerCustomSnackbarConfig(
    variant: SnackBarType.failure,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: AppColors.whiteColor,
      borderRadius: 1,
      dismissDirection: DismissDirection.horizontal,
      margin: const EdgeInsets.only(bottom: 0, right: 5, left: 5),
      barBlur: 0.6,
      messageColor: AppColors.whiteColor,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
    ),
  );
}
