import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';

class CustomMainButton extends StatelessWidget {
  final Function onPressed;
  final String? title;
  final String? svgTitle;
  final bool secondary;
  final bool enable;
  const CustomMainButton(
      {Key? key,
      required this.onPressed,
      this.svgTitle,
      this.title,
      this.secondary = false,
      this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          if (enable) {
            onPressed();
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: svgTitle != null ? 0 : 1,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          backgroundColor: (svgTitle != null || secondary)
              ? AppColors.backgroundColor
              : enable
                  ? AppColors.primaryColor
                  : AppColors.semiPrimaryColor,
          side: (svgTitle != null || secondary)
              ? BorderSide(color: AppColors.borderColor)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Center(
          child: svgTitle != null
              ? SvgPicture.asset(
                  svgTitle!,
                  fit: BoxFit.scaleDown,
                )
              : Text(
                  title!,
                  style: secondary
                      ? AppStyles.mainTextBold(15.sp)
                      : AppStyles.whiteTextBold(fontSize: 15.sp),
                ),
        ),
      ),
    );
  }
}
