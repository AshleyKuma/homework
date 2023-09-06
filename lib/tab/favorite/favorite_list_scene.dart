import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/base_state.dart';
import '../../common/favorite_manager.dart';
import '../../common/widget/base_widget.dart';
import '../../company/company_detailed_scene.dart';
import '../../controllers/get_company_list_controller.dart';
import '../../network/model/industry.dart';

part 'favorite_list_scene_view.dart';

class FavoriteListScene extends StatefulWidget {
  const FavoriteListScene({super.key});

  static const ROUTE_NAME = "/FavoriteListScene";

  @override
  State<StatefulWidget> createState() => _FavoriteListSceneState();
}

class _FavoriteListSceneState extends BaseSceneState<FavoriteListScene> {
  final _favoriteManager = Get.find<FavoriteIndustryManager>();
  final _getCompanyListController = Get.find<GetCompanyListController>();

  Future<void> _onGoToCompanyDetail(Industry industry) async {
    Get.toNamed(CompanyDetailedScene.ROUTE_NAME,
        arguments: CompanyDetailedScene.genArgs(
          industry: industry,
        ));
  }

  @override
  BaseStateWidgetBuilder<_FavoriteListSceneState> get widgetBuilder => _FavoriteListSceneBuilder(this);
}
