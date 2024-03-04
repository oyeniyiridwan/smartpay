import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/app/app.router.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_main_button.dart';
import 'package:smart_pay/utils/constants/app_strings.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';

class ConfirmationView extends StatelessWidget {
  final String name;
  const ConfirmationView({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(thumbs),
            ),
            Text(
              'Congratulations, $name',
              style: AppStyles.mainTextBold(25.sp),
            ),
            10.verticalSpace,
            Text(
              'You’ve completed the onboarding,\n you can start using',
              style: AppStyles.mainTextNormal(17.sp),
              textAlign: TextAlign.center,
            ),
            25.verticalSpace,
            CustomMainButton(
              onPressed: () {
                navigationService.navigateToDashBoardView();
              },
              title: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}
