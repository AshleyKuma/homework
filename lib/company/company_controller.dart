import 'package:get/get.dart';

import '../app_routes.dart';
import '../common/widget/base_getx_widget.dart';
import '../managers/industry_manager.dart';
import '../../network/model/industry.dart';
import '../company_detailed/company_detailed_controller.dart';

class CompanyController extends BaseController {
  static const ARG_INDUSTRY_TYPE = "ARG_INDUSTRY_TYPE";
  static Map<String, dynamic> genArgs({required IndustryType type}) => {
        ARG_INDUSTRY_TYPE: type,
      };

  final industryManager = Get.find<IndustryManager>();
  final argIndustryType = Get.arguments[CompanyController.ARG_INDUSTRY_TYPE] as IndustryType;

  List<Industry> get companies => industryManager.getCompaniesByIndustryType(argIndustryType);

  Future<void> onGoToCompanyDetail(Industry industry) async {
    Get.toNamed(AppRoutes.CompanyDetailed,
        arguments: CompanyDetailedController.genArgs(
          industry: industry,
        ));
  }
}
