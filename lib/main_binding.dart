import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/favorite_manager.dart';
import 'controllers/get_company_list_controller.dart';
import 'controllers/get_industry_list_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() async {
    await Get.putAsync(() => SharedPreferences.getInstance(), permanent: true);

    // Get.put(GetIndustryListController());
    Get.put(GetCompanyListController());
    Get.put(FavoriteIndustryManager());
  }
}
