import 'package:flutter/material.dart';
import 'package:smart_pay/ui/password_recovery/password_recovery_viewmodel.dart';
import 'package:smart_pay/ui/password_recovery/widget/create_new_password.dart';
import 'package:smart_pay/ui/password_recovery/widget/recovery.dart';
import 'package:smart_pay/ui/password_recovery/widget/verify_identity.dart';
import 'package:stacked/stacked.dart';

class PasswordRecoveryView extends StatelessWidget {
  const PasswordRecoveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PasswordRecoveryViewModel>.reactive(
      viewModelBuilder: () => PasswordRecoveryViewModel(),
      builder: (BuildContext context, PasswordRecoveryViewModel viewModel,
          Widget? child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: PageView(
            controller: viewModel.controller,
            children: const [Recovery(), VerifyIdentity(), CreateNewPassword()],
            onPageChanged: (int index) {
              viewModel.onPageChange(index);
            },
          ),
        );
      },
    );
  }
}
