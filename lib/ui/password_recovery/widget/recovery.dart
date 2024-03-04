import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/ui/password_recovery/password_recovery_viewmodel.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_main_button.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_text_field.dart';
import 'package:smart_pay/utils/constants/app_strings.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:stacked/stacked.dart';

class Recovery extends ViewModelWidget<PasswordRecoveryViewModel> {
  const Recovery({Key? key}) : super(key: key);

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
                lockIcon2,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password Recovery',
                  style: AppStyles.mainTextBold(25.sp),
                ),
                10.verticalSpace,
                Text(
                  'Enter your registered email below to receive\n password instructions',
                  style: AppStyles.mainTextNormal(17.sp),
                ),
                30.verticalSpace,
                const CustomTextField(
                  hintText: 'Email',
                ),
                const Spacer(),
                CustomMainButton(
                  onPressed: () {
                    viewModel.onPageChange(1);
                  },
                  title: 'Send me email',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
