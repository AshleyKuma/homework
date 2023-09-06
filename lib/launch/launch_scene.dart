import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/tab/tabbar_item.dart';

import '../common/base_state.dart';
import '../controllers/get_company_list_controller.dart';
import '../tab/favorite/favorite_list_scene.dart';
import '../tab/industry/industry_list_scene.dart';

part 'launch_scene_view.dart';

const String loadingWording = "讀取資料中...";
const String fetchFailedWording = "資料讀取失敗，請稍後再試";

class LaunchScene extends StatefulWidget {
  static const ROUTE_NAME = "/LaunchScene";

  const LaunchScene({super.key});

  @override
  BaseSceneState<LaunchScene> createState() => _LaunchSceneState();
}

class _LaunchSceneState extends BaseSceneState<LaunchScene> {
  Rx<TabBarItem> selectedTabBar = TabBarItem.industry.obs;
  final _getCompanyListController = Get.find<GetCompanyListController>();

  @override
  void initState() {
    super.initState();

    _getCompanyListController.apiResultStateListener(
      (state) => state.maybeWhen<void>(
        success: (_) => [EasyLoading.dismiss()],
        loading: (_) => [EasyLoading.show(status: loadingWording)],
        error: (_) => [EasyLoading.showError(fetchFailedWording), EasyLoading.dismiss()],
        orElse: () => [EasyLoading.showError(fetchFailedWording), EasyLoading.dismiss()],
      ),
    );

    // _getIndustryListController.apiResultStateListener(
    //   (state) => state.maybeWhen<void>(
    //     success: (_) => [EasyLoading.dismiss()],
    //     loading: (_) => [EasyLoading.show(status: loadingWording)],
    //     error: (_) => [EasyLoading.showError(fetchFailedWording), EasyLoading.dismiss()],
    //     orElse: () => [EasyLoading.showError(fetchFailedWording), EasyLoading.dismiss()],
    //   ),
    // );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _getIndustryListController.getIndustryList();
      _getCompanyListController.getCompanyList();
    });
  }

  void switchTab(TabBarItem tabBarItem) => selectedTabBar.value = tabBarItem;

  @override
  BaseStateWidgetBuilder<BaseState<StatefulWidget>> get widgetBuilder => _LaunchSceneBuilder(this);
}
