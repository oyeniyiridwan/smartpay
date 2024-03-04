import 'package:smart_pay/app/app.locator.dart';
import 'package:smart_pay/services/api_services/api_service.dart';
import 'package:smart_pay/services/connectivity_service.dart';
import 'package:smart_pay/services/shared_preferences_service.dart';
import 'package:stacked_services/stacked_services.dart';

///* THIS IS A FILE WHERE ALL LOCATOR SERVICES ARE WRITTEN
///* THIS FILE IS USED TO INJECT SERVICES INTO THE APP

final bottomSheetService = locator<BottomSheetService>();
final dialogService = locator<DialogService>();
final navigationService = locator<NavigationService>();
final snackBarService = locator<SnackbarService>();
final sharedPreferencesService = locator<SharedPreferencesService>();
final connectivityService = locator<ConnectivityService>();
final apiService = locator<ApiService>();
