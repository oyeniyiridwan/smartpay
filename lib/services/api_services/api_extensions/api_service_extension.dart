import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/services/api_services/api_service.dart';
import 'package:smart_pay/utils/constants/api_endpoints.dart';
import 'package:smart_pay/utils/constants/db_constants.dart';
import 'package:smart_pay/utils/handlers/api_response_handler.dart';

/// ======= AUTHENTICATION API METHODS ======= ///
extension AuthenticationApis on ApiService {
  Future<ApiResponse?> getEmailToken({required String email}) async {
    final body = {
      'email': email,
    };
    return await post(getEmailTokenEndpoint, body: body, doesNotNeedAuth: true);
  }

  Future<ApiResponse?> verifyEmailToken(
      {required String email, required String token}) async {
    final body = {
      'email': email,
      'token': token,
    };
    return await post(verifyEmailTokenEndpoint,
        body: body, doesNotNeedAuth: true);
  }

  Future<ApiResponse?> SignUp(
      {required String fullName,
      required String username,
      required String email,
      required String countryCode,
      required String password}) async {
    final body = {
      'full_name': fullName,
      'username': username,
      'email': email,
      'country': countryCode,
      'password': password,
      'device_name': 'mobile',
    };
    sharedPreferencesService.setMap(keyUserDetails, body);
    return await post(registerEndpoint, body: body, doesNotNeedAuth: true);
  }

  Future<ApiResponse?> Login(
      {required String email, required String password}) async {
    final body = {
      'email': email,
      'password': password,
      'device_name': 'mobile',
    };
    return await post(loginEndpoint, body: body, doesNotNeedAuth: true);
  }

  Future<ApiResponse?> home() async {
    return await get(dashboardEndpoint);
  }

  Future<ApiResponse?> LogOut() async {
    return await post(logoutEndpoint, body: {});
  }
}
