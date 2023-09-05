import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/common/widget/base_app_bar.dart';
import '../../common/base_state.dart';
import '../../common/constrants.dart';
import '../../controllers/get_industry_list_controller.dart';
import '../../network/model/industry.dart';
import '../../network/model/industry_model.dart';

part 'industry_list_scene_view.dart';
part 'industry_list_scene_binding.dart';

class IndustryListScene extends StatefulWidget {
  const IndustryListScene({super.key});

  static const ROUTE_NAME = "/IndustryListScene";

  @override
  State<StatefulWidget> createState() => _IndustryListSceneState();
}

class _IndustryListSceneState extends BaseSceneState<IndustryListScene> {
  final _getIndustryListController = Get.find<GetIndustryListController>();

  @override
  void initState() {
    super.initState();

    _getIndustryListController.apiResultStateListener(
      (state) => state.maybeWhen<void>(
        success: (data) {
          EasyLoading.dismiss();
        },
        loading: (_) => [EasyLoading.show(status: str_loading)],
        error: (_) => [EasyLoading.showError(str_fetch_fail), EasyLoading.dismiss()],
        orElse: () => [EasyLoading.showError(str_fetch_fail), EasyLoading.dismiss()],
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getIndustryListController.getIndustryList();
    });
  }

  Future<void> _onTryAgain() async {
    _getIndustryListController.getIndustryList();
  }

  Future<void> _onCompanyList() async {}

  @override
  BaseStateWidgetBuilder<_IndustryListSceneState> get widgetBuilder => _IndustryListSceneBuilder(this);
}
