import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/app/app.router.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/ui/auth/auth_view.form.dart';
import 'package:smart_pay/ui/auth/auth_viewmodel.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_main_button.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_text_field.dart';
import 'package:smart_pay/utils/constants/app_strings.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:smart_pay/utils/field_validator.dart';
import 'package:stacked/stacked.dart';

class SignIn extends ViewModelWidget<AuthViewModel> with $AuthView {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Padding(
      padding: EdgeInsets.all(25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 5.sp, end: 25.sp),
            duration: const Duration(seconds: 2),
            builder: (BuildContext context, double value, Widget? child) {
              return Text(
                'Hi There! 👋',
                style: AppStyles.mainTextBold(value),
              );
            },
          ),
          5.verticalSpace,
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 5.sp, end: 18.sp),
            duration: const Duration(seconds: 2),
            builder: (BuildContext context, double value, Widget? child) {
              return Text(
                'Welcome back, Sign in to your account',
                style: AppStyles.mainTextNormal(value),
              );
            },
          ),
          40.verticalSpace,
          CustomTextField(
            hintText: 'Email',
            textEditingController: emailController,
            focusNode: emailFocusNode,
            validator: FieldValidator.validateEmail(),
            keyboardType: TextInputType.emailAddress,
          ),
          15.verticalSpace,
          CustomTextField(
            hintText: 'Password',
            hasSuffixIcon: true,
            focusNode: passwordFocusNode,
            textEditingController: passwordController,
            obscureText: viewModel.obscure,
            suffixButton: IconButton(
              splashRadius: 10.r,
              onPressed: () {
                viewModel.switchObscure();
              },
              icon: Icon(
                viewModel.obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 25.sp,
              ),
            ),
          ),
          10.verticalSpace,
          TextButton(
            onPressed: () {
              navigationService.navigateToPasswordRecoveryView();
            },
            child: Text(
              'Forgot Password?',
              style: AppStyles.secondaryTextBold(16.sp),
            ),
          ),
          10.verticalSpace,
          CustomMainButton(
            enable: viewModel.validEmailAndPassword,
            onPressed: () {
              viewModel.Login();
            },
            title: 'Sign in',
          ),
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
                child: const Divider(
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
                child: const Divider(
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
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account?',
                style: AppStyles.mainTextNormal(16.sp),
              ),
              TextButton(
                onPressed: () {
                  viewModel.switchPage();
                },
                child: Text(
                  'Sign Up',
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
