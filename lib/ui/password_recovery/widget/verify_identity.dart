import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/ui/password_recovery/password_recovery_viewmodel.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_main_button.dart';
import 'package:smart_pay/utils/constants/app_strings.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:stacked/stacked.dart';

class VerifyIdentity extends ViewModelWidget<PasswordRecoveryViewModel> {
  const VerifyIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Padding(
      padding: EdgeInsets.all(25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.2.sh,
            child: Container(
              height: 72.h,
              width: 72.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.greyColor,
              ),
              child: SvgPicture.asset(
                personIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify your identity',
                  style: AppStyles.mainTextBold(25.sp),
                ),
                10.verticalSpace,
                RichText(
                  text: TextSpan(
                      style: AppStyles.mainTextNormal(17.sp),
                      children: [
                        const TextSpan(text: 'Where would you like'),
                        TextSpan(
                          text: ' Smartpay',
                          style: AppStyles.mainTextBold(17.sp)
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                        const TextSpan(text: ' to send your\n security code?'),
                      ]),
                ),
                30.verticalSpace,
                ListTile(
                  tileColor: AppColors.greyColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  leading: Container(
                    height: double.infinity,
                    width: 20.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.greenColor),
                    child: Icon(
                      Icons.check,
                      size: 15.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  title: Text(
                    'Email',
                    style: AppStyles.mainTextBold(16.sp),
                  ),
                  subtitle: Text(
                    'A*******@mail.com',
                    style: AppStyles.mainTextNormal(12.sp),
                  ),
                  trailing: Icon(
                    Icons.email_outlined,
                    size: 20.sp,
                  ),
                ),
                const Spacer(),
                CustomMainButton(
                  onPressed: () {
                    viewModel.onPageChange(2);
                  },
                  title: 'Continue',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
