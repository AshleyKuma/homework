import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'common/dio/http_service_module.dart';
import 'greeting/greeting_scene.dart';
import 'launch/launch_scene.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() async {
    await HttpServiceModule().bind();
    runApp(const MyApp());
  }, (error, stackTrace) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Fugle-Homework',
        getPages: [
          GetPage(name: LaunchScene.ROUTE_NAME, page: () => const LaunchScene(), bindings: [
            LaunchSceneBinding(),
          ]),
        ],
        builder: EasyLoading.init(),
        home: const GreetingScene());
  }
}
