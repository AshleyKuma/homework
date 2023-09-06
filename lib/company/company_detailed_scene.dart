import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/common/extension/extension.dart';
import 'package:homework/common/widget/base_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/base_state.dart';
import '../common/favorite_manager.dart';
import '../common/widget/base_widget.dart';
import '../common/widget/modal_presenter.dart';
import '../network/model/industry.dart';

part 'company_detailed_scene_view.dart';

class CompanyDetailedScene extends StatefulWidget {
  const CompanyDetailedScene({super.key});

  static const ROUTE_NAME = "/CompanyDetailedScene";
  static const String ARG_INDUSTRY = "ARG_INDUSTRY";

  static Map<String, dynamic> genArgs({required Industry industry}) => {
        ARG_INDUSTRY: industry,
      };

  @override
  State<StatefulWidget> createState() => _CompanyDetailedSceneState();
}

class _CompanyDetailedSceneState extends BaseSceneState<CompanyDetailedScene> {
  final _argIndustry = Get.arguments[CompanyDetailedScene.ARG_INDUSTRY] as Industry;
  final _favoriteManager = Get.find<FavoriteIndustryManager>();
  final _scrollController = ScrollController();

  final _rxRemark = RxString('');
  String get remark => _rxRemark.value;
  set remark(String value) => _rxRemark.value = value;

  Future<void> _onVisitWebsite() async {
    final filePath = _argIndustry.website;
    final uri = Uri.parse(filePath);
    if (!await launchUrl(uri)) {
      ModalPresenter.presentAlert(title: "Oops", content: "無法打開 $filePath");
    }
  }

  Future<void> _onFavoriteTapped() async {
    String codename = _argIndustry.companyCodename;
    if (_favoriteManager.isAlreadyAddedToFavorite(codename)) {
      final option = await ModalPresenter.presentDialog(
        title: "從追蹤列表移除",
        content: "是否將 ${_argIndustry.infoInShort} 從追蹤列表移除？",
        positiveText: "移除",
      );
      if (option == DialogOption.positive) {
        _favoriteManager.removeFromFavorite(codename);
      }
    } else {
      final option = await ModalPresenter.presentDialog(
        title: "加入追蹤列表",
        content: "是否將 ${_argIndustry.infoInShort} 加入追蹤列表內？",
        positiveText: "加入",
      );
      if (option == DialogOption.positive) {
        _favoriteManager.addToFavorite(codename);
      }
    }
  }

  @override
  BaseStateWidgetBuilder<_CompanyDetailedSceneState> get widgetBuilder => _CompanyDetailedSceneBuilder(this);
}
