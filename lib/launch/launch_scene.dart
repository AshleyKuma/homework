import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/tab/tabbar_item.dart';

import '../common/base_state.dart';
import '../controllers/get_industry_list_controller.dart';
import '../network/model/industry.dart';
import '../tab/favorite/favorite_list_scene.dart';
import '../tab/industry/industry_list_scene.dart';

part 'launch_scene_view.dart';

class LaunchScene extends StatefulWidget {
  static const ROUTE_NAME = "/LaunchScene";

  const LaunchScene({super.key});

  @override
  BaseSceneState<LaunchScene> createState() => _LaunchSceneState();
}

class _LaunchSceneState extends BaseSceneState<LaunchScene> {
  Rx<TabBarItem> selectedTabBar = TabBarItem.industry.obs;

  void switchTab(TabBarItem tabBarItem) => selectedTabBar.value = tabBarItem;

  @override
  BaseStateWidgetBuilder<BaseState<StatefulWidget>> get widgetBuilder => _LaunchSceneBuilder(this);
}
