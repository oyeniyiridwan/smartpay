import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/utils/constants/app_strings.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(40.w, 0, 40.w, 40.h),
            child: Image(
              image: const AssetImage(phone),
              height: 0.7.sh,
              fit: BoxFit.fill,
              width: 0.6.sw,
            ),
          ),
          Positioned(
            left: 0.05.sw,
            top: 0.05.sh,
            child: Container(
              height: 50.h,
              width: 50.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
              ),
              child: SvgPicture.asset(
                lockIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0.3.sh,
            child: const Image(
              image: AssetImage(group),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              color: AppColors.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Finance app the safest \n and most trusted',
                    style: AppStyles.mainTextBold(25.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Your finance work starts here. Our here to help\n you track and deal with speeding up your\n transactions.',
                    style: AppStyles.mainTextNormal(15.sp),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0.21.sh,
            child: const Image(
              image: AssetImage(mapGroup),
            ),
          ),
        ],
      ),
    );
  }
}
