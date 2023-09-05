part of 'launch_scene.dart';

class LaunchSceneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetIndustryListController());
  }
}
