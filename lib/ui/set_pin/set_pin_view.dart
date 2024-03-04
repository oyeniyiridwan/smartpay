import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/ui/set_pin/set_pin_view.form.dart';
import 'package:smart_pay/ui/set_pin/set_pin_viewmodel.dart';
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
class SetPinView extends StatelessWidget with $SetPinView {
  final bool login;
  const SetPinView({Key? key, this.login = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetPinViewModel>.reactive(
      viewModelBuilder: () => SetPinViewModel(),
      onViewModelReady: (model) {
        syncFormWithViewModel(model);
      },
      builder:
          (BuildContext context, SetPinViewModel viewModel, Widget? child) {
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
                  actions: [
                    TextButton(
                      onPressed: () {
                        viewModel.skip(login);
                      },
                      child: Text(
                        'Skip',
                        style: AppStyles.secondaryTextBold(18.sp),
                      ),
                    )
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.all(25.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Set your PIN code',
                          style: AppStyles.mainTextBold(25.sp),
                        ),
                        8.verticalSpace,
                        Text(
                          'We use state-of-the-art security measures to\n protect your information at all times',
                          style: AppStyles.mainTextNormal(17.sp),
                        ),
                        20.verticalSpace,
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
                            height: 1.sw / 8,
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
                            height: 1.sw / 8,
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            decoration: const BoxDecoration(
                                color: AppColors.backgroundColor,
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.secondaryColor,
                                        width: 2))),
                          ),
                        ),
                        40.verticalSpace,
                        CustomMainButton(
                          enable: viewModel.requiredPinLength,
                          onPressed: () {
                            viewModel.createPin(login: login);
                          },
                          title: 'Create Pin',
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
