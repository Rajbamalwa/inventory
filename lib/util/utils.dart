import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../common/routes.dart';

class Utils {
  Future<void> handleStatusCode400(String message) async {
    debugPrint("test_handleStatusCode400: call");

    Fluttertoast.showToast(msg: message);
  }

  Future<void> handleStatusCodeUnauthorizedBackend() async {
    debugPrint("test_handleStatusCodeUnauthorized: Backend");

    Fluttertoast.showToast(
        msg: "Please log in to access all features and functionality.");

    // await preferenceService.erase();
    await Get.offAllNamed(RouteName.loginScreen);
  }

  Future<void> handleStatusCodeUnauthorizedServer() async {
    debugPrint("test_handleStatusCodeUnauthorized: Server");
    Fluttertoast.showToast(
        msg: "Please log in to access all features and functionality.");

    // await preferenceService.erase();
    await Get.offAllNamed(RouteName.loginScreen);
  }

  void handleCatchPreferenceServiceErase() {
    debugPrint("test_handleStatusCodeUnauthorized: Erase");

    // preferenceService.erase();
  }
}

NiogenGoTo(name, {id, arguments, parameter}) {
  Get.toNamed(name, id: id, arguments: arguments, parameters: parameter);
}

NiogenOfTo(name, {id, arguments, parameter}) {
  Get.offNamed(name, id: id, arguments: arguments, parameters: parameter);
}
