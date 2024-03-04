import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/ui/password_recovery/password_recovery_viewmodel.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_back_button.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_main_button.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_text_field.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:stacked/stacked.dart';

class CreateNewPassword extends ViewModelWidget<PasswordRecoveryViewModel> {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Padding(
      padding: EdgeInsets.all(25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.1.sh,
            child: const Column(
              children: [Spacer(), CustomBackButton()],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create New Password',
                    style: AppStyles.mainTextBold(25.sp),
                  ),
                  10.verticalSpace,
                  Text(
                    'Please, enter a new password below different\n from the previous password',
                    style: AppStyles.mainTextNormal(17.sp),
                  ),
                  35.verticalSpace,
                  CustomTextField(
                    hintText: 'New Password',
                    hasSuffixIcon: true,
                    obscureText: viewModel.obscureNew,
                    suffixButton: IconButton(
                      splashRadius: 10.r,
                      onPressed: () {
                        viewModel.switchObscureNew();
                      },
                      icon: Icon(
                        viewModel.obscureNew
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 25.sp,
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  CustomTextField(
                    hintText: 'Confirm Password',
                    hasSuffixIcon: true,
                    obscureText: viewModel.obscureConfirm,
                    suffixButton: IconButton(
                      splashRadius: 10.r,
                      onPressed: () {
                        viewModel.switchObscureConfirm();
                      },
                      icon: Icon(
                        viewModel.obscureConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 25.sp,
                      ),
                    ),
                  ),
                  const Spacer(),
                  CustomMainButton(
                    onPressed: () {},
                    title: 'Create new password',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
