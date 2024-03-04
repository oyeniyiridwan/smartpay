import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/ui/pin_login/pin_login_view.form.dart';
import 'package:smart_pay/ui/pin_login/pin_login_viewmodel.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_back_button.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_main_button.dart';
import 'package:smart_pay/ui/shared/smart_widget/custom_keyboard/custom_keyboard_view.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(
  fields: [
    FormTextField(name: 'pin'),
  ],
)
class PinLoginView extends StatelessWidget with $PinLoginView {
  const PinLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PinViewLoginModel>.reactive(
      viewModelBuilder: () => PinViewLoginModel(),
      onViewModelReady: (model) {
        syncFormWithViewModel(model);
      },
      builder:
          (BuildContext context, PinViewLoginModel viewModel, Widget? child) {
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
                  padding: EdgeInsets.all(15.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi There! 👋',
                          style: AppStyles.mainTextBold(25.sp),
                        ),
                        8.verticalSpace,
                        Text(
                          'Welcome back, Sign in with your PIN',
                          style: AppStyles.mainTextNormal(17.sp),
                        ),
                        15.verticalSpace,
                        Pinput(
                          autofocus: false,
                          obscureText: true,
                          useNativeKeyboard: false,
                          length: 5,
                          obscuringCharacter: '●',
                          controller: pinController,
                          defaultPinTheme: PinTheme(
                            textStyle: AppStyles.mainTextBold(20.sp),
                            width: 1.sw / 8,
                            height: 1.sh / 16,
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            decoration: const BoxDecoration(
                                color: AppColors.backgroundColor,
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.greyColor, width: 2))),
                          ),
                          focusedPinTheme: PinTheme(
                            textStyle: AppStyles.mainTextBold(20.sp),
                            width: 1.sw / 8,
                            height: 1.sh / 16,
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            decoration: const BoxDecoration(
                                color: AppColors.backgroundColor,
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.secondaryColor,
                                        width: 2))),
                          ),
                        ),
                        28.verticalSpace,
                        CustomMainButton(
                          enable: viewModel.requiredPinLength,
                          onPressed: () {
                            viewModel.loginPin();
                          },
                          title: 'Login',
                        ),
                        8.verticalSpace,
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
                        8.verticalSpace,
                        CustomMainButton(
                          secondary: true,
                          onPressed: () {
                            viewModel.authLogin();
                          },
                          title: 'Use Password',
                        ),
                        const Spacer(),
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
