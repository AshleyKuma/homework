import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_routes.dart';
import '../common/widget/base_getx_widget.dart';
import '../flutter_gen/assets.gen.dart';

class InitialController extends BaseController {
  @override
  void onReady() {
    super.onReady();
    _offToLaunch();
  }

  void _offToLaunch() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(AppRoutes.Launch);
  }
}

class InitialView extends BaseView<InitialController> {
  InitialView({super.key});

  @override
  InitialController createController() => InitialController();

  @override
  Widget sceneWidget(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Assets.launchLogo.image(width: 256, height: 125)),
      );
}
