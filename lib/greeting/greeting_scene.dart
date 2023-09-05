import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/launch/launch_scene.dart';
import '../common/base_state.dart';
import '../flutter_gen/assets.gen.dart';

class GreetingScene extends StatefulWidget {
  const GreetingScene({super.key});

  @override
  BaseSceneState<GreetingScene> createState() => _GreetingSceneState();
}

class _GreetingSceneState extends BaseSceneState<GreetingScene> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAllNamed(LaunchScene.ROUTE_NAME);
    });
  }

  @override
  BaseStateWidgetBuilder<BaseState<StatefulWidget>> get widgetBuilder => _GreetingSceneBuilder(this);
}

class _GreetingSceneBuilder extends BaseSceneWidgetBuilder<_GreetingSceneState> {
  const _GreetingSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Assets.launchLogo.image(width: 256, height: 125)),
      );
}
