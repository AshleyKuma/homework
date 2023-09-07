import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/tab/tabbar_item.dart';

import '../common/widget/base_getx_widget.dart';
import '../managers/industry_manager.dart';

const String loadingWording = "讀取資料中...";
const String fetchFailedWording = "資料讀取失敗，請稍後再試";

class LaunchController extends BaseController {
  final industryManager = Get.find<IndustryManager>();
  Rx<TabBarItem> selectedTabBar = TabBarItem.industry.obs;

  @override
  void onReady() {
    super.onReady();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      industryManager.getCompanyList();
    });

    industryManager.apiResultStateListener(
      (state) => state.maybeWhen<void>(
        success: (_) => [EasyLoading.dismiss()],
        loading: (_) => [EasyLoading.show(status: loadingWording)],
        error: (_) => [EasyLoading.showError(fetchFailedWording), EasyLoading.dismiss()],
        orElse: () => [EasyLoading.showError(fetchFailedWording), EasyLoading.dismiss()],
      ),
    );
  }

  void switchTab(TabBarItem tabBarItem) => selectedTabBar.value = tabBarItem;
}
