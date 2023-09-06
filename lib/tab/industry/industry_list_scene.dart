import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/common/widget/modal_presenter.dart';
import 'package:homework/company/company_list_scene.dart';
import 'package:homework/network/model/industry.dart';
import '../../common/base_state.dart';
import '../../common/widget/base_widget.dart';
import '../../controllers/get_company_list_controller.dart';
import '../../network/model/industry_display_model.dart';

part 'industry_list_scene_view.dart';

const String loadingWording = "讀取資料中...";
const String fetchFailedWording = "資料讀取失敗，請稍後再試";

class IndustryListScene extends StatefulWidget {
  const IndustryListScene({super.key});

  static const ROUTE_NAME = "/IndustryListScene";

  @override
  State<StatefulWidget> createState() => _IndustryListSceneState();
}

class _IndustryListSceneState extends BaseSceneState<IndustryListScene> {
  final _getCompanyListController = Get.find<GetCompanyListController>();

  Future<void> _onTryAgain() async {
    // _getIndustryListController.getIndustryList();
    _getCompanyListController.getCompanyList();
  }

  Future<void> _onGoToCompanyList(IndustryDisplayModel? model) async {
    if (model == null) {
      ModalPresenter.presentAlert(title: "Oops", content: "此產業別沒有上市公司資料");
      return;
    }
    Get.toNamed(CompanyListScene.ROUTE_NAME,
        arguments: CompanyListScene.genArgs(
          type: model.industryType,
        ));
  }

  @override
  BaseStateWidgetBuilder<_IndustryListSceneState> get widgetBuilder => _IndustryListSceneBuilder(this);
}
