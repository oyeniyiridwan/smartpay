import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_back_button.dart';
import 'package:smart_pay/utils/constants/app_strings.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashBoardViewModel>.reactive(
      viewModelBuilder: () => DashBoardViewModel(),
      onViewModelReady: (model) {
        model.init();
      },
      builder:
          (BuildContext context, DashBoardViewModel viewModel, Widget? child) {
        return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leadingWidth: 80.w,
              leading: const CustomBackButton(),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                SizedBox(
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.LogOut();
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        backgroundColor: AppColors.primaryColor,
                      ),
                      child: const Text('Log out'),
                    ),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        style: AppStyles.mainTextBold(25.sp),
                        children: [
                          const TextSpan(text: 'Smart '),
                          TextSpan(
                            text: ' pay ',
                            style: AppStyles.mainTextBold(25.sp)
                                .copyWith(color: AppColors.secondaryColor),
                          ),
                          const TextSpan(text: 'secret\n'),
                          TextSpan(
                            text: ' message',
                            style: AppStyles.mainTextBold(25.sp)
                                .copyWith(color: AppColors.secondaryColor),
                          ),
                        ]),
                  ),
                  60.verticalSpace,
                  Text(
                    viewModel.content,
                    maxLines: 5,
                    style: AppStyles.mainTextNormal(20.sp),
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        viewModel.author,
                        style: AppStyles.secondaryTextBold(17.sp),
                      ),
                    ],
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage(thumbs),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          style: AppStyles.mainTextBold(17.sp),
                          children: [
                            const TextSpan(text: 'Act'),
                            TextSpan(
                              text: ' Smart ',
                              style: AppStyles.secondaryTextBold(17.sp)
                                  .copyWith(color: AppColors.secondaryColor),
                            ),
                          ]),
                    ),
                  ),
                  20.verticalSpace
                ],
              ),
            ));
      },
    );
  }
}
