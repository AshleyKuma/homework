import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/greeting/greeting_view.dart';
import 'package:homework/tab/favorite/favorite_view.dart';
import 'package:homework/tab/industry/industry_view.dart';
import 'common/dio/http_service_module.dart';
import 'company/company_detail_view.dart';
import 'company/company_view.dart';
import 'launch/launch_view.dart';
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
        GetPage(name: LaunchController.routeName, page: () => LaunchView()),
        GetPage(name: IndustryController.routeName, page: () => IndustryView()),
        GetPage(name: FavoriteController.routeName, page: () => FavoriteView()),
        GetPage(name: CompanyController.routeName, page: () => CompanyView()),
        GetPage(name: CompanyDetailedController.routeName, page: () => CompanyDetailedView()),
      ],
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: InitialView(),
    );
  }
}
