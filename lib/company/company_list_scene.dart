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

part 'company_list_scene_view.dart';

class CompanyListScene extends StatefulWidget {
  const CompanyListScene({super.key});

  static const ROUTE_NAME = "/CompanyListScene";

  @override
  State<StatefulWidget> createState() => _CompanyListSceneState();
}

class _CompanyListSceneState extends BaseSceneState<CompanyListScene> {
  final _getCompanyListController = Get.find<GetCompanyListController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  BaseStateWidgetBuilder<_CompanyListSceneState> get widgetBuilder => _CompanyListSceneBuilder(this);
}
