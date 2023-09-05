part of 'industry_list_scene.dart';

class IndustryListSceneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetIndustryListController());
  }
}
