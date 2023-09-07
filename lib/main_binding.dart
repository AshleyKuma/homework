import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'managers/favorite_manager.dart';
import 'managers/industry_manager.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() async {
    await Get.putAsync(() => SharedPreferences.getInstance(), permanent: true);
    Get.put(IndustryManager());
    Get.put(FavoriteManager());
  }
}
