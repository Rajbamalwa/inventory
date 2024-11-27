import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../Services/repository.dart';
import '../../constant/colors.dart';
import 'on_boarding_controller.dart';

class onBoardingUi extends GetView<OnBoardingController> {
  onBoardingUi({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<OnBoardingController>(
      init: OnBoardingController(UserRepository()),
      builder: (controller) {
        return Scaffold(
          key: controller.key,
          backgroundColor: white,
          body: ListView(
            children: [],
          ),
        );
      },
    );
  }
}
