import 'package:get/get.dart';

import '../../app_routes.dart';
import '../../common/widget/base_getx_widget.dart';
import '../../company_detailed/company_detailed_controller.dart';
import '../../managers/favorite_manager.dart';
import '../../common/widget/modal_presenter.dart';
import '../../managers/industry_manager.dart';
import '../../network/model/industry.dart';

class FavoriteController extends BaseController {
  final favoriteManager = Get.find<FavoriteManager>();
  final industryManager = Get.find<IndustryManager>();

  Future<void> onGoToCompanyDetail(Industry industry) async {
    Get.toNamed(AppRoutes.CompanyDetailed,
        arguments: CompanyDetailedController.genArgs(
          industry: industry,
        ));
  }

  Future<bool> onSwiftLeft(Industry industry) async {
    final option = await ModalPresenter.presentDialog(
      title: "從追蹤列表移除",
      content: "是否將 ${industry.infoInShort} 從追蹤列表移除？",
      positiveText: "移除",
    );
    if (option == DialogOption.positive) {
      favoriteManager.removeFromFavorite(industry.companyCodename);
      return true;
    }
    return false;
  }
}
