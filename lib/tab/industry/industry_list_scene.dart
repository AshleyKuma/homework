import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/common/favorite_manager.dart';
import 'package:homework/common/widget/base_app_bar.dart';
import 'package:homework/common/widget/modal_presenter.dart';
import 'package:homework/company/company_list_scene.dart';
import '../../common/base_state.dart';
import '../../common/widget/base_widget.dart';
import '../../controllers/get_company_list_controller.dart';
import '../../controllers/get_industry_list_controller.dart';
import '../../network/model/industry_model.dart';

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
  final _getIndustryListController = Get.find<GetIndustryListController>();
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

    _getIndustryListController.apiResultStateListener(
      (state) => state.maybeWhen<void>(
        success: (_) => [EasyLoading.dismiss()],
        loading: (_) => [EasyLoading.show(status: loadingWording)],
        error: (_) => [EasyLoading.showError(fetchFailedWording), EasyLoading.dismiss()],
        orElse: () => [EasyLoading.showError(fetchFailedWording), EasyLoading.dismiss()],
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getIndustryListController.getIndustryList();
      _getCompanyListController.getCompanyList();
    });
  }

  Future<void> _onTryAgain() async {
    _getIndustryListController.getIndustryList();
    _getCompanyListController.getCompanyList();
  }

  Future<void> _onGoToCompanyList(IndustryModel model) async {
    if (model.companyCount == 0) {
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
