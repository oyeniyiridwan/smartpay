import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/app/app.router.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/ui/on_boarding/onboarding_viewmodel.dart';
import 'package:smart_pay/ui/on_boarding/widget/onboarding_one.dart';
import 'package:smart_pay/ui/on_boarding/widget/onboarding_two.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_main_button.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.reactive(
      onDispose: (_) {
        _.dispose();
        debugPrint('disposed');
      },
      viewModelBuilder: () => OnBoardingViewModel(),
      builder:
          (BuildContext context, OnBoardingViewModel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 0.15.sh,
                    child: Row(
                      children: [
                        const Spacer(),
                        if (viewModel.currentIndex == 0)
                          TextButton(
                            onPressed: () {
                              viewModel.onPageChanged(1);
                            },
                            child: Text(
                              'Skip',
                              style: AppStyles.secondaryTextBold(16.sp)
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.7.sh,
                  width: double.infinity,
                  child: PageView(
                    controller: viewModel.pageController,
                    children: const [OnBoardingOne(), OnBoardingTwo()],
                    onPageChanged: (int index) {
                      viewModel.onPageChanged(index);
                    },
                  ),
                ),
                SizedBox(
                  height: 0.15.sh,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Column(
                      children: [
                        SmoothPageIndicator(
                          controller: viewModel.pageController,
                          count: 2,
                          effect: ExpandingDotsEffect(
                              dotHeight: 8.h,
                              dotWidth: 8.w,
                              expansionFactor: 5,
                              activeDotColor: AppColors.primaryColor,
                              dotColor: AppColors.borderColor),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: CustomMainButton(
                            onPressed: () {
                              navigationService.navigateToAuthView();
                            },
                            title: 'Get Started',
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
