import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common/process_services.dart';
import '../constant/api_constants.dart';
import '../util/utils.dart';

class ApiServices {
  // final SharedPreferenceService preferenceService =
  //     Get.find<SharedPreferenceService>();
  final ProgressService progressService = Get.find<ProgressService>();
  //
  Map<String, String> getJsonHeader() {
    final Map<String, String> header = <String, String>{};
    header[jsonHeaderName] = jsonHeaderValue;
    return header;
  }

  Future<Map<String, String>> getAuthorisedHeader() async {
    token = await _getAuthToken();
    //}
    final Map<String, String> header = getJsonHeader();
    if (token.isNotEmpty) {
      debugPrint("Bearer token: $token");
      header[jsonAuthenticationName] = "Bearer $token";

      header['Content-type'] = 'application/json';
      header['Accept'] = 'application/json';
    }
    return header;
  }

  Future<String> _getAuthToken() async {
    final String? token = ""; //preferenceService.getToken();
    log("Token---${token.toString()}");
    if (token != null) {
      return token;
    } else {
      return "";
    }
  }

  Future<http.Response> get(String url,
      {String? endPoint,
      Map<String, dynamic>? queryParams,
      Map<String, String>? headers,
      bool closeDialogOnTimeout = true}) async {
    if (headers == null) {
      headers = await getAuthorisedHeader();
      log("headers: $headers");
    }
    log('url: ${ApiConstants.baseUrl}$url');
    endPoint ??= ApiConstants.baseUrl;

    if (queryParams != null && queryParams.isNotEmpty) {
      final queryString = Uri(queryParameters: queryParams).query;
      url += url.contains('?') ? '&' : '?$queryString';
    }

    try {
      log("printing - URL - ${endPoint + url}");
      final http.Response response =
          await http.get(Uri.parse(endPoint + url), headers: headers);

      if (response.statusCode == HttpStatus.unauthorized) {
        Utils().handleStatusCodeUnauthorizedServer();
      } else if (response.statusCode == HttpStatus.badRequest) {
        Utils().handleStatusCode400(response.body);
      }
      await doLiveStreamPendingTasks(response);
      return response;
    } on SocketException catch (e) {
      if (e.osError?.message == 'Connection timed out') {
        throw CustomException(
            'Connection Timeout: Status Code: ${e.osError?.errorCode} Status Message: ${e.osError?.message}');
      } else {
        throw CustomException('Socket Exception: ${e.toString()}');
      }
    }
  }

  delete(String url,
      {Map<String, String>? headers, bool closeDialogOnTimeout = true}) async {
    if (headers == null) {
      headers = await getAuthorisedHeader();
      log("headers: $headers");
    }

    final http.Response response = await http
        .delete(Uri.parse(ApiConstants.baseUrl + url), headers: headers)
        .timeout(const Duration(minutes: 1), onTimeout: () {
      if (closeDialogOnTimeout) {
        progressService.showProgressDialog(false);
      }
      throw CustomException("Please check your Internet connection");
    });

    if (response.statusCode == HttpStatus.unauthorized) {
      Utils().handleStatusCodeUnauthorizedServer();
    } else if (response.statusCode == HttpStatus.badRequest) {
      Utils().handleStatusCode400(response.body);
    }
    //   log('response: ${response.body}');
    await doLiveStreamPendingTasks(response);
    return response;
  }

  Future<http.Response> post(String url,
      {String? endPoint,
      Map<String, String>? headers,
      dynamic body,
      Encoding? encoding,
      bool closeDialogOnTimeout = true}) async {
    endPoint ??= ApiConstants.baseUrl;
    headers ??= await getAuthorisedHeader();

    try {
      var response = await http
          .post(Uri.parse(endPoint + url),
              headers: headers, body: body, encoding: encoding)
          .timeout(
            const Duration(minutes: 1),
          )
          .catchError((error) {
        print('Error occurred during HTTP request: $error');
      });

      if (response.statusCode == HttpStatus.unauthorized) {
        Utils().handleStatusCodeUnauthorizedServer();
      } else if (response.statusCode == HttpStatus.badRequest) {
        Utils().handleStatusCode400(response.body);
      }
      await doLiveStreamPendingTasks(response);
      return response;
    } on SocketException catch (e) {
      if (e.osError?.message == 'Connection timed out') {
        throw CustomException(
            'Connection Timeout: Status Code: ${e.osError?.errorCode} Status Message: ${e.osError?.message}');
      } else {
        throw CustomException('Socket Exception: ${e.toString()}');
      }
    }
  }

  Future<http.Response> put(String url,
      {Map<String, String>? headers,
      dynamic body,
      Encoding? encoding,
      bool closeDialogOnTimeout = true}) async {
    headers ??= await getAuthorisedHeader();
    final http.Response response = await http
        .put(Uri.parse(ApiConstants.baseUrl + url),
            headers: headers, body: body, encoding: encoding)
        .timeout(const Duration(minutes: 1), onTimeout: () {
      if (closeDialogOnTimeout) {
        progressService.showProgressDialog(false);
      }
      throw CustomException("Please check your Internet connection");
    });

    if (response.statusCode == HttpStatus.unauthorized) {
      Fluttertoast.showToast(
          msg: "Please login to access the all the Functionality");

      Utils().handleStatusCodeUnauthorizedServer();
    } else if (response.statusCode == HttpStatus.badRequest) {
      Utils().handleStatusCode400(response.body);
    }
    await doLiveStreamPendingTasks(response);
    return response;
  }
}

class CustomException extends AppException {
  String message;
  bool isDebug;

  CustomException(this.message, {this.isDebug = false});

  @override
  void onException(
      {Function()? onButtonClick,
      String title = "DivineTalk",
      Function()? onDismissClick,
      String buttonText = "Ok",
      String? dismissButtonText,
      bool shouldShowFlushBar = true}) {
    log("exceptionissue" + message);
    if (message.isNotEmpty) {
      if (shouldShowFlushBar) {
        // openAlertView(text: message);
        if (message.toLowerCase() != 'unauthorized') {
          if (isDebug) {
            if (kDebugMode) {
              Fluttertoast.showToast(msg: message);
            }
          } else {
            Fluttertoast.showToast(msg: message);
          }
        }
      } else {
        debugPrint(message);
        if (message.toLowerCase() != 'unauthorized') {
          if (isDebug) {
            if (kDebugMode) {
              Fluttertoast.showToast(msg: message);
            }
          } else {
            Fluttertoast.showToast(msg: message);
          }
        }
      }
    }
  }
}

Future<void> doLiveStreamPendingTasks(http.Response response) async {
  final bool cond1 = response.statusCode == HttpStatus.unauthorized;
  final bool cond2 =
      json.decode(response.body)["status_code"] == HttpStatus.unauthorized;
  print("LiveGlobalSingleton:: doLiveStreamPendingTasks():: cond1:: $cond1");
  print("LiveGlobalSingleton:: doLiveStreamPendingTasks():: cond2:: $cond2");

  // if (cond1 || cond2) {
  //   await LiveGlobalSingleton().leaveLiveIfIsInLiveScreen();
  // } else {}

  return Future<void>.value();
}

abstract class AppException implements Exception {
  void onException(
      {Function()? onButtonClick,
      String title,
      Function()? onDismissClick,
      String buttonText,
      String dismissButtonText});
}

class OtpInvalidTimerException implements Exception {
  final String message;

  OtpInvalidTimerException(this.message);

  @override
  String toString() {
    return 'MyCustomException: $message';
  }
}
