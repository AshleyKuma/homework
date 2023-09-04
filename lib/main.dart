import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'launch/launch_scene.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Fugle-Homework',
        getPages: [
          GetPage(
            name: LaunchScene.ROUTE_NAME,
            page: () => const LaunchScene(),
          ),
          GetPage(
            name: TestScene.ROUTE_NAME,
            page: () => const TestScene(),
          ),
        ],
        home: const LaunchScene());
  }
}
