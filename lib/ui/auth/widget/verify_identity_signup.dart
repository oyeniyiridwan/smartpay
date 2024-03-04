import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/ui/auth/auth_view.form.dart';
import 'package:smart_pay/ui/auth/auth_viewmodel.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_back_button.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_main_button.dart';
import 'package:smart_pay/ui/shared/smart_widget/custom_keyboard/custom_keyboard_view.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:smart_pay/utils/utilities.dart';
import 'package:stacked/stacked.dart';

class VerifyIdentitySignUp extends StatelessWidget with $AuthView {
  final String email;
  const VerifyIdentitySignUp({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        model.startTimer();
        syncFormWithViewModel(model);
      },
      builder: (BuildContext context, AuthViewModel viewModel, Widget? child) {
        return Stack(
          children: [
            Scaffold(
                backgroundColor: AppColors.backgroundColor,
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  leadingWidth: 80.w,
                  leading: const CustomBackButton(),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                body: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: 5.sp, end: 25.sp),
                          duration: const Duration(seconds: 2),
                          builder: (BuildContext context, double value,
                              Widget? child) {
                            return Text(
                              'Verify it’s you',
                              style: AppStyles.mainTextBold(value),
                            );
                          },
                        ),
                        8.verticalSpace,
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: 5.sp, end: 15),
                          duration: const Duration(seconds: 2),
                          builder: (BuildContext context, double value,
                              Widget? child) {
                            return Text(
                              'We send a code to (${hideEmail(email)}). Enter it \nhere to verify your identity',
                              style: AppStyles.mainTextNormal(value),
                            );
                          },
                        ),
                        20.verticalSpace,
                        Pinput(
                          autofocus: false,
                          obscureText: false,
                          useNativeKeyboard: false,
                          length: 5,
                          obscuringCharacter: '●',
                          controller: pinController,
                          defaultPinTheme: PinTheme(
                            textStyle: AppStyles.mainTextBold(20.sp),
                            width: 0.125.sw,
                            height: 0.125.sw,
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            decoration: const BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            textStyle: AppStyles.mainTextBold(20.sp),
                            width: 0.125.sw,
                            height: 0.125.sw,
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            decoration: BoxDecoration(
                                color: AppColors.greyColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                    color: AppColors.secondaryColor)),
                          ),
                        ),
                        15.verticalSpace,
                        Center(
                            child: TextButton(
                          onPressed: () async {
                            if (viewModel.duration.inSeconds == 0) {
                              debugPrint(email);
                              await viewModel.getEmailToken(
                                  email: email, resend: true);
                              viewModel.resetTimer();
                              viewModel.startTimer();
                            }
                          },
                          child: Text(
                            viewModel.duration.inSeconds == 0
                                ? 'resend token'
                                : 'Resend Code ${viewModel.duration.inSeconds} secs',
                            style: AppStyles.mainTextNormal(15.sp).copyWith(
                                color: viewModel.duration.inSeconds == 0
                                    ? Colors.red
                                    : AppColors.primaryColor),
                          ),
                        )),
                        const Spacer(),
                        CustomMainButton(
                          enable: viewModel.requiredPinLength,
                          onPressed: () {
                            viewModel.verifyEmailToken(email);
                          },
                          title: 'Confirm',
                        ),
                        7.verticalSpace,
                        CustomKeyBoardView(
                          controller: pinController,
                        ),
                      ]),
                )),
            if (viewModel.isBusy)
              Container(
                color: Colors.black38,
                child: const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.secondaryColor),
                ),
              )
          ],
        );
      },
    );
  }
}
