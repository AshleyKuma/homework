import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widget/base_getx_widget.dart';
import '../../common/widget/base_widget.dart';
import '../../network/model/industry.dart';
import 'industry_controller.dart';

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
        return controller.industryManager.apiResultState.maybeWhen(
          loading: (_) => const SizedBox.shrink(),
          success: (_) {
            final data = controller.industryManager.companiesForDisplay;
            if (data.isEmpty) {
              return BaseWidget.emptyView;
            }

            /// 迴圈所有產業別
            final industryTypeList = IndustryType.values.where((e) => e != IndustryType.unknown).map((type) {
              final currentType = data.firstWhereOrNull((e) => e.industryType == type);

              /// API 若沒回傳則一律帶 0
              int currentTypeCount = currentType == null ? 0 : currentType.companyCount;
              return BaseWidget.cell(
                text: "${type.desc} ($currentTypeCount)",
                onTap: () => controller.onGoToCompanyList(currentType),
              );
            }).toList();
            return ListView(padding: EdgeInsets.zero, children: industryTypeList);
          },
          orElse: () => BaseWidget.emptyView,
          error: (_) => BaseWidget.emptyView,
        );
      });
}
