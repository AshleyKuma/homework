import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/tab/favorite/favorite_view.dart';
import 'package:homework/tab/tabbar_item.dart';

import '../common/widget/base_getx_widget.dart';
import '../managers/industry_manager.dart';
import '../tab/industry/industry_view.dart';

const String loadingWording = "讀取資料中...";
const String fetchFailedWording = "資料讀取失敗，請稍後再試";

class LaunchController extends BaseController {
  final _industryManager = Get.find<IndustryManager>();
  Rx<TabBarItem> selectedTabBar = TabBarItem.industry.obs;

  @override
  void onReady() {
    super.onReady();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _industryManager.getCompanyList();
    });

    _industryManager.apiResultStateListener(
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

class LaunchView extends BaseView<LaunchController> {
  LaunchView({super.key});

  @override
  LaunchController createController() => LaunchController();

  @override
  Widget sceneWidget(BuildContext context) => Obx(() => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: TabBarItem.values.map((item) => BottomNavigationBarItem(label: item.title, icon: Icon(item.icon))).toList(),
          showUnselectedLabels: true,
          currentIndex: controller.selectedTabBar.value.index,
          onTap: (index) => controller.switchTab(TabBarItem.values[index]),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
        ),
        body: IndexedStack(
          index: controller.selectedTabBar.value.index,
          children: [
            IndustryView(),
            FavoriteView(),
          ],
        ),
      ));
}
