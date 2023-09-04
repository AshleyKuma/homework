import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaunchScene extends StatefulWidget {
  static const ROUTE_NAME = "/LaunchScene";

  const LaunchScene({super.key});

  @override
  State<LaunchScene> createState() => _LaunchSceneState();
}

class _LaunchSceneState extends State<LaunchScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: GestureDetector(
              onTap: () {
                Get.toNamed(TestScene.ROUTE_NAME);
              },
              child: const Text("Loading"))),
    );
  }
}

class TestScene extends StatefulWidget {
  static const ROUTE_NAME = "/TestScene";

  const TestScene({super.key});

  @override
  State<TestScene> createState() => _TestSceneState();
}

class _TestSceneState extends State<TestScene> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("TestScene")),
    );
  }
}
