import 'package:get/get.dart';

import '../view/on_boarding/on_boarding_binding.dart';
import '../view/on_boarding/on_boarding_ui.dart';

class RouteName {
  //static const initial = root;

  static const String root = "/";
  static const String onBoarding = "/onBoarding";
  static const String loginScreen = "/loginScreen";
}

// Created by divine-dharam
List<String> get validRoutes {
  return [
    RouteName.root,
    RouteName.onBoarding,
  ];
}

class Routes {
  static final routes = <GetPage>[
    GetPage(
      page: () => onBoardingUi(),
      name: RouteName.onBoarding,
      binding: OnBoardingBinding(),
    ),
  ];
}
