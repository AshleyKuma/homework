import 'package:get/get.dart';

import 'controllers/get_company_list_controller.dart';
import 'controllers/get_industry_list_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetIndustryListController());
    Get.put(GetCompanyListController());
  }
}
