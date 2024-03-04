import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_pay/services/api_services/api_service.dart';
import 'package:smart_pay/services/connectivity_service.dart';
import 'package:smart_pay/services/shared_preferences_service.dart';
import 'package:smart_pay/ui/auth/auth_view.dart';
import 'package:smart_pay/ui/auth/widget/verify_identity_signup.dart';
import 'package:smart_pay/ui/confirmation/confirmation_view.dart';
import 'package:smart_pay/ui/dashboard/dashboard_view.dart';
import 'package:smart_pay/ui/on_boarding/onboarding_view.dart';
import 'package:smart_pay/ui/password_recovery/password_recovery_view.dart';
import 'package:smart_pay/ui/pin_login/pin_login_view.dart';
import 'package:smart_pay/ui/register/register_view.dart';
import 'package:smart_pay/ui/set_pin/set_pin_view.dart';
import 'package:smart_pay/ui/splash/splash_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    CustomRoute(
      page: SplashView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
      reverseDurationInMilliseconds: 200,
      initial: true,
    ),
    CustomRoute(
      page: OnBoardingView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
      reverseDurationInMilliseconds: 200,
    ),
    CustomRoute(
      page: AuthView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
      reverseDurationInMilliseconds: 200,
    ),
    CustomRoute(
      page: PasswordRecoveryView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
      reverseDurationInMilliseconds: 200,
    ),
    CustomRoute(
      page: VerifyIdentitySignUp,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
      reverseDurationInMilliseconds: 200,
    ),
    CustomRoute(
      page: RegisterView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
      reverseDurationInMilliseconds: 200,
    ),
    CustomRoute(
      page: SetPinView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
      reverseDurationInMilliseconds: 200,
    ),
    CustomRoute(
      page: ConfirmationView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
      reverseDurationInMilliseconds: 200,
    ),
    CustomRoute(
      page: PinLoginView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
      reverseDurationInMilliseconds: 200,
    ),
    CustomRoute(
      page: DashBoardView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
      reverseDurationInMilliseconds: 200,
    ),
  ],
  logger: StackedLogger(),
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferences.getInstance,
    ),
    Presolve(
      classType: ConnectivityService,
      presolveUsing: ConnectivityService.getInstance,
    ),
    Singleton(classType: ApiService),
  ],
)
class App {}
