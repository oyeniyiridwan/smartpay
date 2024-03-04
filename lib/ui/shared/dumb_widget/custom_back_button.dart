import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/utils/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomBackButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 10.r,
      onPressed: () {
        navigationService.back();
        if (onPressed != null) {
          onPressed!();
        }
      },
      icon: Container(
        padding: EdgeInsets.only(left: 10.w),
        height: 80.h,
        width: 40.w,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(10.r)),
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
