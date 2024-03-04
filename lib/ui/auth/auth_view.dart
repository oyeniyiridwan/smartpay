import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/ui/auth/auth_view.form.dart';
import 'package:smart_pay/ui/auth/auth_viewmodel.dart';
import 'package:smart_pay/ui/auth/widget/sign_in.dart';
import 'package:smart_pay/ui/auth/widget/sign_up.dart';
import 'package:smart_pay/ui/shared/dumb_widget/custom_back_button.dart';
import 'package:smart_pay/utils/constants/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(
  fields: [
    FormTextField(name: 'pin'),
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class AuthView extends StatelessWidget with $AuthView {
  final int? index;
  const AuthView({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      onModelReady: (model) {
        syncFormWithViewModel(model);
        model.init(index);
      },
      viewModelBuilder: () => AuthViewModel(),
      builder: (BuildContext context, AuthViewModel viewModel, Widget? child) {
        return GestureDetector(
          onTap: () {
            emailFocusNode.unfocus();
          },
          child: Stack(
            children: [
              Scaffold(
                  backgroundColor: AppColors.backgroundColor,
                  resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    leadingWidth: 80.w,
                    leading: CustomBackButton(),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  body: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return IndexedStack(
                        index: viewModel.currentIndex,
                        children: [SignUp(), SignIn()],
                      );
                    },
                  )),
              if (viewModel.isBusy)
                Container(
                  color: Colors.black38,
                  child: Center(
                    child: CircularProgressIndicator(
                        color: AppColors.secondaryColor),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
