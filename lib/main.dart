import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:homework/network/model/industry.dart';
import 'package:homework/tab/favorite/favorite_list_scene.dart';
import 'package:homework/tab/industry/industry_list_scene.dart';
import 'common/dio/http_service_module.dart';
import 'controllers/get_industry_list_controller.dart';
import 'greeting/greeting_scene.dart';
import 'launch/launch_scene.dart';

void main() {
  runZonedGuarded(() async {
    await HttpServiceModule().bind();
    Get.put(GetIndustryListController());
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
        ],
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        home: const GreetingScene());
  }
}
