import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/common/widget/base_app_bar.dart';
import 'package:homework/common/widget/modal_presenter.dart';
import '../../common/base_state.dart';
import '../common/widget/base_widget.dart';
import '../../controllers/get_company_list_controller.dart';
import '../../controllers/get_industry_list_controller.dart';
import '../../network/model/industry_model.dart';
import '../network/model/industry.dart';
import 'company_detailed_scene.dart';

part 'company_list_scene_view.dart';

class CompanyListScene extends StatefulWidget {
  const CompanyListScene({super.key});

  static const ROUTE_NAME = "/CompanyListScene";
  static const String ARG_INDUSTRY_TYPE = "ARG_INDUSTRY_TYPE";

  static Map<String, dynamic> genArgs({required IndustryType type}) => {
        ARG_INDUSTRY_TYPE: type,
      };

  @override
  State<StatefulWidget> createState() => _CompanyListSceneState();
}

class _CompanyListSceneState extends BaseSceneState<CompanyListScene> {
  final _getCompanyListController = Get.find<GetCompanyListController>();
  final _argIndustryType = Get.arguments[CompanyListScene.ARG_INDUSTRY_TYPE] as IndustryType;

  List<Industry> get _companies => _getCompanyListController.getCompaniesByIndustryType(_argIndustryType);

  Future<void> _onGoToCompanyDetail(Industry industry) async {
    Get.toNamed(CompanyDetailedScene.ROUTE_NAME,
        arguments: CompanyDetailedScene.genArgs(
          industry: industry,
        ));
  }

  @override
  BaseStateWidgetBuilder<_CompanyListSceneState> get widgetBuilder => _CompanyListSceneBuilder(this);
}
