import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/tab/tabbar_item.dart';

import '../common/widget/base_getx_widget.dart';
import '../tab/favorite/favorite_view.dart';
import '../tab/industry/industry_view.dart';
import 'launch_controller.dart';

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
