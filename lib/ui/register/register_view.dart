import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/ui/register/register_view.form.dart';
import 'package:smart_pay/ui/register/register_viewmodel.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_back_button.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_country_selector_and_number_input.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_main_button.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_text_field.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:smart_pay/utils/field_validator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(
  fields: [
    FormTextField(name: 'fullName'),
    FormTextField(name: 'username'),
    FormTextField(name: 'password'),
  ],
)
class RegisterView extends StatelessWidget with $RegisterView {
  final String email;
  const RegisterView({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      onViewModelReady: (model) {
        syncFormWithViewModel(model);
      },
      onDispose: (model) {
        model.clearFormData();
      },
      builder:
          (BuildContext context, RegisterViewModel viewModel, Widget? child) {
        return Stack(
          children: [
            Scaffold(
                backgroundColor: AppColors.backgroundColor,
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  leadingWidth: 80.w,
                  leading: const CustomBackButton(),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                body: Padding(
                  padding: EdgeInsets.all(25.h),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 1.sh,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TweenAnimationBuilder(
                            tween: Tween<double>(begin: 5.sp, end: 25.sp),
                            duration: const Duration(seconds: 2),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return RichText(
                                text: TextSpan(
                                    style: AppStyles.mainTextBold(value),
                                    children: [
                                      const TextSpan(
                                          text:
                                              'Hey there! tell us a bit\n about'),
                                      TextSpan(
                                        text: ' yourself',
                                        style: AppStyles.mainTextBold(value)
                                            .copyWith(
                                                color:
                                                    AppColors.secondaryColor),
                                      ),
                                    ]),
                              );
                            },
                          ),

                          15.verticalSpace,
                          CustomTextField(
                            textEditingController: fullNameController,
                            hintText: 'Full Name',
                            keyboardType: TextInputType.name,
                            validator: FieldValidator.validateString(),
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            textEditingController: usernameController,
                            hintText: 'Username',
                            keyboardType: TextInputType.name,
                            validator: FieldValidator.validateString(),
                          ),
                          15.verticalSpace,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            height: 60.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r)),
                            ),
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomCountrySelector(
                                      onTap: viewModel.onChange,
                                    ),
                                    Text(
                                      viewModel.countryName!.isNotEmpty
                                          ? viewModel.countryName.toString()
                                          : 'Click flag to Select Country',
                                      style: AppStyles.mainTextNormal(16.sp),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                const Icon(Icons.expand_more),
                              ],
                            ),
                          ),
                          // /(),,
                          15.verticalSpace,
                          CustomTextField(
                            textEditingController: passwordController,
                            hintText: 'Password',
                            hasSuffixIcon: true,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: viewModel.obscure,
                            validator: FieldValidator.validatePlainPass(),
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
                          30.verticalSpace,
                          CustomMainButton(
                            enable: viewModel.readyToRegister,
                            onPressed: () async {
                              await viewModel.signUp(email);
                            },
                            title: 'Continue',
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
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
