import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/ui/splash/splash_viewmodel.dart';
import 'package:smart_pay/utils/constants/app_strings.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (model) {
          model.init();
        },
        builder:
            (BuildContext context, SplashViewModel viewModel, Widget? child) {
          return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: Center(
                child: Image(
                  image: AssetImage(launch),
                  fit: BoxFit.fill,
                  height: 100.h,
                  width: 100.w,
                ),
              ));
        });
  }
}
