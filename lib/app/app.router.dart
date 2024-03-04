// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i13;
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:smart_pay/ui/auth/auth_view.dart' as _i4;
import 'package:smart_pay/ui/auth/widget/verify_identity_signup.dart' as _i6;
import 'package:smart_pay/ui/confirmation/confirmation_view.dart' as _i9;
import 'package:smart_pay/ui/dashboard/dashboard_view.dart' as _i11;
import 'package:smart_pay/ui/on_boarding/onboarding_view.dart' as _i3;
import 'package:smart_pay/ui/password_recovery/password_recovery_view.dart'
    as _i5;
import 'package:smart_pay/ui/pin_login/pin_login_view.dart' as _i10;
import 'package:smart_pay/ui/register/register_view.dart' as _i7;
import 'package:smart_pay/ui/set_pin/set_pin_view.dart' as _i8;
import 'package:smart_pay/ui/splash/splash_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const splashView = '/';

  static const onBoardingView = '/on-boarding-view';

  static const authView = '/auth-view';

  static const passwordRecoveryView = '/password-recovery-view';

  static const verifyIdentitySignUp = '/verify-identity-sign-up';

  static const registerView = '/register-view';

  static const setPinView = '/set-pin-view';

  static const confirmationView = '/confirmation-view';

  static const pinLoginView = '/pin-login-view';

  static const dashBoardView = '/dash-board-view';

  static const all = <String>{
    splashView,
    onBoardingView,
    authView,
    passwordRecoveryView,
    verifyIdentitySignUp,
    registerView,
    setPinView,
    confirmationView,
    pinLoginView,
    dashBoardView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.onBoardingView,
      page: _i3.OnBoardingView,
    ),
    _i1.RouteDef(
      Routes.authView,
      page: _i4.AuthView,
    ),
    _i1.RouteDef(
      Routes.passwordRecoveryView,
      page: _i5.PasswordRecoveryView,
    ),
    _i1.RouteDef(
      Routes.verifyIdentitySignUp,
      page: _i6.VerifyIdentitySignUp,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i7.RegisterView,
    ),
    _i1.RouteDef(
      Routes.setPinView,
      page: _i8.SetPinView,
    ),
    _i1.RouteDef(
      Routes.confirmationView,
      page: _i9.ConfirmationView,
    ),
    _i1.RouteDef(
      Routes.pinLoginView,
      page: _i10.PinLoginView,
    ),
    _i1.RouteDef(
      Routes.dashBoardView,
      page: _i11.DashBoardView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i12.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.SplashView(),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
    },
    _i3.OnBoardingView: (data) {
      return _i12.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i3.OnBoardingView(),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
    },
    _i4.AuthView: (data) {
      final args = data.getArgs<AuthViewArguments>(
        orElse: () => const AuthViewArguments(),
      );
      return _i12.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i4.AuthView(key: args.key, index: args.index),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
    },
    _i5.PasswordRecoveryView: (data) {
      return _i12.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i5.PasswordRecoveryView(),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
    },
    _i6.VerifyIdentitySignUp: (data) {
      final args = data.getArgs<VerifyIdentitySignUpArguments>(nullOk: false);
      return _i12.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i6.VerifyIdentitySignUp(key: args.key, email: args.email),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
    },
    _i7.RegisterView: (data) {
      final args = data.getArgs<RegisterViewArguments>(nullOk: false);
      return _i12.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i7.RegisterView(key: args.key, email: args.email),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
    },
    _i8.SetPinView: (data) {
      final args = data.getArgs<SetPinViewArguments>(
        orElse: () => const SetPinViewArguments(),
      );
      return _i12.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i8.SetPinView(key: args.key, login: args.login),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
    },
    _i9.ConfirmationView: (data) {
      final args = data.getArgs<ConfirmationViewArguments>(nullOk: false);
      return _i12.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i9.ConfirmationView(key: args.key, name: args.name),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
    },
    _i10.PinLoginView: (data) {
      return _i12.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i10.PinLoginView(),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
    },
    _i11.DashBoardView: (data) {
      return _i12.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i11.DashBoardView(),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AuthViewArguments {
  const AuthViewArguments({
    this.key,
    this.index,
  });

  final _i13.Key? key;

  final int? index;

  @override
  String toString() {
    return '{"key": "$key", "index": "$index"}';
  }

  @override
  bool operator ==(covariant AuthViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.index == index;
  }

  @override
  int get hashCode {
    return key.hashCode ^ index.hashCode;
  }
}

class VerifyIdentitySignUpArguments {
  const VerifyIdentitySignUpArguments({
    this.key,
    required this.email,
  });

  final _i13.Key? key;

  final String email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant VerifyIdentitySignUpArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class RegisterViewArguments {
  const RegisterViewArguments({
    this.key,
    required this.email,
  });

  final _i13.Key? key;

  final String email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant RegisterViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class SetPinViewArguments {
  const SetPinViewArguments({
    this.key,
    this.login = false,
  });

  final _i13.Key? key;

  final bool login;

  @override
  String toString() {
    return '{"key": "$key", "login": "$login"}';
  }

  @override
  bool operator ==(covariant SetPinViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.login == login;
  }

  @override
  int get hashCode {
    return key.hashCode ^ login.hashCode;
  }
}

class ConfirmationViewArguments {
  const ConfirmationViewArguments({
    this.key,
    required this.name,
  });

  final _i13.Key? key;

  final String name;

  @override
  String toString() {
    return '{"key": "$key", "name": "$name"}';
  }

  @override
  bool operator ==(covariant ConfirmationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.name == name;
  }

  @override
  int get hashCode {
    return key.hashCode ^ name.hashCode;
  }
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnBoardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onBoardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthView({
    _i13.Key? key,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.authView,
        arguments: AuthViewArguments(key: key, index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPasswordRecoveryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.passwordRecoveryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyIdentitySignUp({
    _i13.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyIdentitySignUp,
        arguments: VerifyIdentitySignUpArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView({
    _i13.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.registerView,
        arguments: RegisterViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSetPinView({
    _i13.Key? key,
    bool login = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.setPinView,
        arguments: SetPinViewArguments(key: key, login: login),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmationView({
    _i13.Key? key,
    required String name,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.confirmationView,
        arguments: ConfirmationViewArguments(key: key, name: name),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPinLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pinLoginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashBoardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashBoardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnBoardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onBoardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthView({
    _i13.Key? key,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.authView,
        arguments: AuthViewArguments(key: key, index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPasswordRecoveryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.passwordRecoveryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyIdentitySignUp({
    _i13.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.verifyIdentitySignUp,
        arguments: VerifyIdentitySignUpArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView({
    _i13.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.registerView,
        arguments: RegisterViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSetPinView({
    _i13.Key? key,
    bool login = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.setPinView,
        arguments: SetPinViewArguments(key: key, login: login),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmationView({
    _i13.Key? key,
    required String name,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.confirmationView,
        arguments: ConfirmationViewArguments(key: key, name: name),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPinLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pinLoginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashBoardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashBoardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
