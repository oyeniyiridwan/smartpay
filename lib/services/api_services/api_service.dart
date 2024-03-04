import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay/app/app.logger.dart';
import 'package:smart_pay/app/services_export.dart';
import 'package:smart_pay/utils/constants/db_constants.dart';
import 'package:smart_pay/utils/enums.dart';
import 'package:smart_pay/utils/handlers/api_response_handler.dart';
import 'package:smart_pay/utils/handlers/dio_interceptors.dart';

class ApiService {
  final log = getLogger('ApiService');

  final dio = Dio();

  final String baseUrl =
      'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1';

  late String? _tokenString = sharedPreferencesService.getString(keyToken);

  ApiService() {
    dio.interceptors.add(DioInterceptor());
    dio.options.sendTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.options.baseUrl = baseUrl;

    log.i('API constructed and DIO setup registered');
  }

  ///* ======= BASE API REQUEST METHODS ======= ///

  /// ==== POST METHOD ==== ///
  Future<ApiResponse?> post(
    String string, {
    required Map<String, dynamic> body,
    bool doesNotNeedAuth = false,
  }) async {
    _tokenString = sharedPreferencesService.getString(keyToken);
    await connectivityService.checkConnection();
    if (connectivityService.hasConnection) {
      log.i('Making request to $string');
      body.removeWhere((key, value) => value == null);
      log.d('With payload $body');
      log.d('with token $_tokenString');
      try {
        final response = await dio.post(
          string,
          data: body,
          options: doesNotNeedAuth == true
              ? null
              : Options(
                  headers: {'Authorization': 'Bearer $_tokenString'},
                ),
        );
        log.i('Response from $string \n${response.data}');
        return ApiUtils.toApiResponse(response);
      } on DioError catch (e) {
        var msg = 'Something went wrong';
        debugPrint(e.response?.data);

        if (e.response?.data is Map) {
          msg = e.response!.data['message'].toString();
          debugPrint('message:$msg');
        }
        if (e.response?.data?.containsKey('errors')) {
          if (e.response?.data['errors'].containsKey('email') &&
              e.response?.data['errors'].containsKey('password')) {
            if (e.response!.data['errors']['email'].isNotEmpty) {
              msg = e.response!.data['errors']['email'][0].toString();
            } else {
              msg = e.response!.data['errors']['password'][0].toString();
            }
          } else if (e.response?.data['errors'].containsKey('token')) {
            if (e.response!.data['errors']['token'].isNotEmpty) {
              msg = e.response!.data['errors']['token'][0].toString();
            }
          } else if (e.response?.data['errors'].containsKey('password')) {
            if (e.response!.data['errors']['password'].isNotEmpty) {
              msg = e.response!.data['errors']['password'][0].toString();
            }
          }
        }
        log.e('ERROR from $string \n${e.message}');
        snackBarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackBarType.failure,
          message: msg,
        );
        log.wtf('From $string  - ${e.response?.data?.toString()}');
        return null;
        //SocketException here is a rare case
      } on SocketException catch (e) {
        snackBarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackBarType.failure,
          message: 'Please check your internet.',
        );
        log.w(e.message.toString());
        return null;
      }
    } else {
      snackBarService.showCustomSnackBar(
        message: 'Please check your internet',
        variant: SnackBarType.failure,
        duration: const Duration(seconds: 3),
      );
      return null;
    }
  }

  Future<ApiResponse?> get(
    String string, {
    Map<String, dynamic>? queryParameters,
  }) async {
    _tokenString = sharedPreferencesService.getString(keyToken);

    connectivityService.checkConnection();
    if (connectivityService.hasConnection) {
      log.i('Making request to $string');
      log.e('_tokenString is $_tokenString');
      queryParameters?.removeWhere((key, value) => value == null);
      log.d('With payload $queryParameters');
      try {
        final response = await dio.get(
          string,
          queryParameters: queryParameters,
          options: Options(
            headers: {
              'Authorization': 'Bearer $_tokenString',
            },
          ),
        );

        log.i('Response from $string \n${response.data}');
        final res = ApiUtils.toApiResponse(response);
        return res;
      } on DioError catch (e) {
        var msg = 'Something went wrong';
        if (e.response?.data is Map) {
          if (e.response?.data?.containsKey('detail')) {
            msg = e.response!.data['detail'].toString();
            debugPrint('message:$msg');
          }
        }
        snackBarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackBarType.failure,
          message: msg,
        );
        log.wtf('From $string  - ${e.response?.data?.toString()}');
        final res = ApiUtils.toApiResponse(e.response);
        return res;
      } on SocketException catch (e) {
        snackBarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackBarType.failure,
          message: 'Please check your internet.',
        );
        log.wtf('From $string  - ${e.message.toString()}');
      } catch (e) {
        snackBarService.showCustomSnackBar(
          message: e.toString(),
          variant: SnackBarType.failure,
          duration: const Duration(seconds: 3),
        );
      }
    } else {
      snackBarService.showCustomSnackBar(
        message: 'Please check your internet',
        variant: SnackBarType.failure,
        duration: const Duration(seconds: 3),
      );
    }
    return null;
  }

  errorHandlers(dynamic e) {}
}
