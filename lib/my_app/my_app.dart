import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/common/routes.dart';

import '../common/middle_ware.dart';
import '../constant/colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: <NavigatorObserver>[
        GetObserver(
          MiddleWare.instance.observer,
          Get.routing,
        ),
      ],
      defaultTransition: Transition.fadeIn,
      debugShowCheckedModeBanner: false,
      title: 'Turf Game',
      initialRoute: RouteName.onBoarding,
      getPages: Routes.routes,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        appBarTheme: AppBarTheme(centerTitle: false, color: white),
        cardTheme: CardTheme(color: white, surfaceTintColor: white),
      ),
    );
  }
}
