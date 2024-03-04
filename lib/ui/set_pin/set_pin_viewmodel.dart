import 'package:smart_pay/app/app.logger.dart';
import 'package:smart_pay/app/app.router.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/ui/set_pin/set_pin_view.form.dart';
import 'package:smart_pay/utils/constants/db_constants.dart';
import 'package:smart_pay/utils/enums.dart';
import 'package:stacked/stacked.dart';

class SetPinViewModel extends FormViewModel {
  final log = getLogger('pin at work');
  bool get requiredPinLength =>
      pinValue != null ? pinValue!.length == 5 : false;

  void createPin({bool login = false}) async {
    if (hasPin) {
      if (pinValue!.length == 5) {
        await sharedPreferencesService.setString(keyLoginPin, pinValue!);
        clearForm();
        final map = sharedPreferencesService.getMap(keyUserDetails);
        var name = map['full_name'];
        if (login) {
          navigationService.replaceWithDashBoardView();
        } else {
          navigationService.replaceWithConfirmationView(name: name);
        }
      } else {
        snackBarService.showCustomSnackBar(
            message: 'pin must be 5 in length', variant: SnackBarType.failure);
      }
    } else {
      snackBarService.showCustomSnackBar(
          message: 'pin cannot be empty', variant: SnackBarType.failure);
    }
  }

  void skip(bool login) async {
    final map = sharedPreferencesService.getMap(keyUserDetails);
    await sharedPreferencesService.clearData(keyLoginPin);
    var name = map['full_name'];
    if (login) {
      navigationService.replaceWithDashBoardView();
    } else {
      navigationService.replaceWithConfirmationView(name: name);
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
