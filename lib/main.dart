import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/company/company_list_scene.dart';
import 'package:homework/tab/favorite/favorite_list_scene.dart';
import 'package:homework/tab/industry/industry_list_scene.dart';
import 'common/dio/http_service_module.dart';
import 'company/company_detailed_scene.dart';
import 'greeting/greeting_scene.dart';
import 'launch/launch_scene.dart';
import 'main_binding.dart';

void main() {
  runZonedGuarded(() async {
    await HttpServiceModule().bind();
    runApp(const MyApp());
  }, (error, stackTrace) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fugle-Homework',
      getPages: [
        GetPage(name: LaunchScene.ROUTE_NAME, page: () => const LaunchScene()),
        GetPage(name: IndustryListScene.ROUTE_NAME, page: () => const IndustryListScene()),
        GetPage(name: FavoriteListScene.ROUTE_NAME, page: () => const FavoriteListScene()),
        GetPage(name: CompanyListScene.ROUTE_NAME, page: () => const CompanyListScene()),
        GetPage(name: CompanyDetailedScene.ROUTE_NAME, page: () => const CompanyDetailedScene()),
      ],
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: const GreetingScene(),
    );
  }
}
