import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/ui/auth/auth_view.form.dart';
import 'package:smart_pay/ui/auth/auth_viewmodel.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_main_button.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_text_field.dart';
import 'package:smart_pay/utils/constants/app_strings.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:smart_pay/utils/field_validator.dart';
import 'package:stacked/stacked.dart';

class SignUp extends ViewModelWidget<AuthViewModel> with $AuthView {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Padding(
      padding: EdgeInsets.all(25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 5.sp, end: 25.sp),
            duration: Duration(seconds: 2),
            builder: (BuildContext context, double value, Widget? child) {
              return RichText(
                text: TextSpan(style: AppStyles.mainTextBold(value), children: [
                  TextSpan(text: 'Create a '),
                  TextSpan(
                    text: 'SmartPay',
                    style: AppStyles.mainTextBold(value)
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  TextSpan(text: '\n account')
                ]),
              );
            },
          ),
          40.verticalSpace,
          CustomTextField(
            hintText: 'Email',
            textEditingController: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: FieldValidator.validateEmail(),
            focusNode: emailFocusNode,
          ),
          25.verticalSpace,
          CustomMainButton(
            onPressed: () async {
              await viewModel.getEmailToken();
            },
            enable: viewModel.validEmail,
            title: 'Sign Up',
          ),
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
                child: Divider(
                  thickness: 0.3,
                  color: AppColors.borderColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'OR',
                  style: AppStyles.mainTextNormal(18.sp),
                ),
              ),
              SizedBox(
                width: 100.w,
                child: Divider(
                  thickness: 0.3,
                  color: AppColors.borderColor,
                ),
              ),
            ],
          ),
          30.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomMainButton(
                  onPressed: () {},
                  svgTitle: googleIcon,
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: CustomMainButton(
                  onPressed: () {},
                  svgTitle: appleIcon,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: AppStyles.mainTextNormal(16.sp),
              ),
              TextButton(
                onPressed: () {
                  viewModel.switchPage();
                },
                child: Text(
                  'Sign In',
                  style: AppStyles.secondaryTextBold(16.sp),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
