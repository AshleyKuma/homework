import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import '../../common/base_state.dart';
import '../../common/favorite_manager.dart';
import '../../common/widget/base_widget.dart';
import '../../common/widget/modal_presenter.dart';
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

  Future<bool> _onSwiftLeft(Industry industry) async {
    final option = await ModalPresenter.presentDialog(
      title: "從追蹤列表移除",
      content: "是否將 ${industry.infoInShort} 從追蹤列表移除？",
      positiveText: "移除",
    );
    if (option == DialogOption.positive) {
      _favoriteManager.removeFromFavorite(industry.companyCodename);
      return true;
    }
    return false;
  }

  @override
  BaseStateWidgetBuilder<_FavoriteListSceneState> get widgetBuilder => _FavoriteListSceneBuilder(this);
}
