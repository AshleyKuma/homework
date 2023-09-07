import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';
import '../../common/widget/base_getx_widget.dart';
import '../../common/widget/base_widget.dart';
import '../../common/widget/modal_presenter.dart';
import '../../company/company_view.dart';
import '../../managers/industry_manager.dart';
import '../../network/model/industry.dart';
import '../../network/model/industry_display_model.dart';

class IndustryController extends BaseController {
  final _industryManager = Get.find<IndustryManager>();

  Future<void> _onGoToCompanyList(IndustryDisplayModel? model) async {
    if (model == null) {
      ModalPresenter.presentAlert(title: "Oops", content: "此產業別沒有上市公司資料");
      return;
    }
    Get.toNamed(AppRoutes.Company, arguments: CompanyController.genArgs(type: model.industryType));
  }
}

class IndustryView extends BaseView<IndustryController> {
  IndustryView({super.key});

  @override
  IndustryController createController() => IndustryController();

  @override
  Widget sceneWidget(BuildContext context) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: BaseWidget.header(title: "產業別"),
            ),
            const SizedBox(height: 15),
            Expanded(child: _list),
            const SizedBox(height: 15),
          ],
        ),
      );

  Widget get _list => Obx(() {
        return controller._industryManager.apiResultState.maybeWhen(
          loading: (_) => const SizedBox.shrink(),
          success: (_) {
            final data = controller._industryManager.companiesForDisplay;
            if (data.isEmpty) {
              return BaseWidget.emptyView;
            }
            final industryTypeList = IndustryType.values.where((e) => e != IndustryType.unknown).map((type) {
              final currentType = data.firstWhereOrNull((e) => e.industryType == type);
              int currentTypeCount = currentType == null ? 0 : currentType.companyCount;
              return BaseWidget.cell(
                text: "${type.desc} ($currentTypeCount)",
                onTap: () => controller._onGoToCompanyList(currentType),
              );
            }).toList();
            return ListView(padding: EdgeInsets.zero, children: industryTypeList);
          },
          orElse: () => BaseWidget.emptyView,
          error: (_) => BaseWidget.emptyView,
        );
      });
}
