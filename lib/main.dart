import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/app_routes.dart';
import 'package:homework/tab/favorite/favorite_view.dart';
import 'package:homework/tab/industry/industry_view.dart';
import 'common/dio/http_service_module.dart';
import 'company/company_view.dart';
import 'company_detailed/company_detailed_view.dart';
import 'initial/initial_view.dart';
import 'launch/launch_view.dart';
import 'main_binding.dart';

void main() async {
  await HttpServiceModule().bind();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fugle-Homework',
      getPages: [
        GetPage(name: AppRoutes.InitialView, page: () => InitialView()),
        GetPage(name: AppRoutes.Launch, page: () => LaunchView()),
        GetPage(name: AppRoutes.Industry, page: () => IndustryView()),
        GetPage(name: AppRoutes.Favorite, page: () => FavoriteView()),
        GetPage(name: AppRoutes.Company, page: () => CompanyView()),
        GetPage(name: AppRoutes.CompanyDetailed, page: () => CompanyDetailedView()),
      ],
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: InitialView(),
    );
  }
}
