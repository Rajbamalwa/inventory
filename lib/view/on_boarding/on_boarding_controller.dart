import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/repository.dart';

class OnBoardingController extends GetxController {
  OnBoardingController(this.userRepository);

  // final pref = Get.find<SharedPreferenceService>();
  final UserRepository userRepository;

  final key = GlobalKey<ScaffoldState>();
  RxBool loading = false.obs;
}
