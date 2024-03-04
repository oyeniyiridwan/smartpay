import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/ui/shared/smart_widget/custom_keyboard/custom_keyboard_viewmodel.dart';
import 'package:smart_pay/utils/constants/app_strings.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:stacked/stacked.dart';

class CustomKeyBoardView extends StatelessWidget {
  final TextEditingController controller;
  const CustomKeyBoardView({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomKeyboardViewModel>.reactive(
      viewModelBuilder: () => CustomKeyboardViewModel(),
      onModelReady: (model) {
        model.init(controller);
      },
      builder: (BuildContext context, viewModel, Widget? child) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.w,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              12,
              (index) => InkWell(
                onTap: () {
                  viewModel.updatePin(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Center(
                    child: index < 9
                        ? Text(
                            '${index + 1}',
                            style: AppStyles.mainTextNormal(22.sp),
                          )
                        : index == 9
                            ? Text('*', style: AppStyles.mainTextNormal(18.sp))
                            : index == 10
                                ? Text(
                                    '0',
                                    style: AppStyles.mainTextNormal(24.sp),
                                  )
                                : SvgPicture.asset(deleteIcon),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
