import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/common/widget/base_app_bar.dart';
import 'package:homework/common/widget/modal_presenter.dart';
import '../../common/base_state.dart';
import '../../common/base_widget.dart';
import '../../controllers/get_company_list_controller.dart';
import '../../controllers/get_industry_list_controller.dart';
import '../../network/model/industry_model.dart';
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

  @override
  BaseStateWidgetBuilder<_CompanyDetailedSceneState> get widgetBuilder => _CompanyDetailedSceneBuilder(this);
}
