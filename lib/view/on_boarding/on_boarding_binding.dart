import 'package:get/get.dart';

import '../../Services/repository.dart';
import 'on_boarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      OnBoardingController(UserRepository()),
      permanent: true,
    );
  }
}
