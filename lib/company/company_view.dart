import 'package:flutter/material.dart';
import '../common/widget/base_getx_widget.dart';
import '../../common/widget/base_widget.dart';
import '../common/widget/base_app_bar.dart';
import 'company_controller.dart';

class CompanyView extends BaseView<CompanyController> {
  CompanyView({super.key});

  @override
  CompanyController createController() => CompanyController();

  @override
  Widget sceneWidget(BuildContext context) => Scaffold(
        appBar: BaseAppBar(title: "產業別"),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: BaseWidget.header(title: controller.argIndustryType.desc),
            ),
            ...controller.companies
                .map((e) => BaseWidget.cell(
                      text: "${e.companyCodename} ${e.companyNameShort}",
                      onTap: () => controller.onGoToCompanyDetail(e),
                    ))
                .toList(),
            const SizedBox(height: 15),
            const SafeArea(child: SizedBox.shrink()),
          ],
        ),
      );
}
