import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/widget/base_getx_widget.dart';
import '../../common/widget/base_widget.dart';
import '../managers/industry_manager.dart';
import '../../network/model/industry.dart';
import '../common/widget/base_app_bar.dart';
import 'company_detail_view.dart';

class CompanyController extends BaseController {
  static const routeName = "/Company";

  static const ARG_INDUSTRY_TYPE = "ARG_INDUSTRY_TYPE";
  static Map<String, dynamic> genArgs({required IndustryType type}) => {
        ARG_INDUSTRY_TYPE: type,
      };

  final _getCompanyListController = Get.find<IndustryManager>();
  final _argIndustryType = Get.arguments[CompanyController.ARG_INDUSTRY_TYPE] as IndustryType;

  List<Industry> get _companies => _getCompanyListController.getCompaniesByIndustryType(_argIndustryType);

  Future<void> _onGoToCompanyDetail(Industry industry) async {
    Get.toNamed(CompanyDetailedController.routeName,
        arguments: CompanyDetailedController.genArgs(
          industry: industry,
        ));
  }
}

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
              child: BaseWidget.header(title: controller._argIndustryType.desc),
            ),
            ...controller._companies
                .map((e) => BaseWidget.cell(
                      text: "${e.companyCodename} ${e.companyNameShort}",
                      onTap: () => controller._onGoToCompanyDetail(e),
                    ))
                .toList(),
            const SizedBox(height: 15),
            const SafeArea(child: SizedBox.shrink()),
          ],
        ),
      );
}
