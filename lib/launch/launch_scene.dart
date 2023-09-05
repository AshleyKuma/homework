import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/base_state.dart';
import '../controllers/get_industry_list_controller.dart';
import '../network/model/industry.dart';

part 'launch_scene_binding.dart';
part 'launch_scene_view.dart';

class LaunchScene extends StatefulWidget {
  static const ROUTE_NAME = "/LaunchScene";

  const LaunchScene({super.key});

  @override
  BaseSceneState<LaunchScene> createState() => _LaunchSceneState();
}

class _LaunchSceneState extends BaseSceneState<LaunchScene> {
  final _getIndustryListController = Get.find<GetIndustryListController>();

  @override
  void initState() {
    super.initState();

    _getIndustryListController.apiResultStateListener(
      (state) => state.maybeWhen<void>(
        success: (data) {
          EasyLoading.dismiss();
          print("data.count:${data.first.releaseDate}");
        },
        loading: (_) => [EasyLoading.show(status: "撈取資料中...")],
        error: (_) => [EasyLoading.showError("資料撈取錯誤，請稍後再試。"), EasyLoading.dismiss()],
        orElse: () => [EasyLoading.showError("資料撈取錯誤，請稍後再試。"), EasyLoading.dismiss()],
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getIndustryListController.getIndustryList();
    });
  }

  Future<void> _onTryAgain() async {
    _getIndustryListController.getIndustryList();
  }

  @override
  BaseStateWidgetBuilder<BaseState<StatefulWidget>> get widgetBuilder => _LaunchSceneBuilder(this);
}
