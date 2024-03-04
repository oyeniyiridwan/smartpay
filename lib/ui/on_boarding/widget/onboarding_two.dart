import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/utils/constants/app_strings.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(40.w, 0, 40.w, 40.h),
            child: Image(
              image: const AssetImage(phoneTwo),
              height: 0.7.sh,
              fit: BoxFit.fill,
              width: 0.6.sw,
            ),
          ),
          Positioned(
            left: 0,
            top: 0.16.sh,
            child: const Image(
              image: AssetImage(groupTwo),
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
                    'The fastest transaction\n process only here',
                    style: AppStyles.mainTextBold(25.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Get easy to pay all your bills with just a few\n steps. Paying your bills become fast and\n efficient.',
                    style: AppStyles.mainTextNormal(16.sp),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 15.w,
            top: 0.2.sh,
            child: const Image(
              image: AssetImage(contact),
            ),
          ),
        ],
      ),
    );
  }
}
