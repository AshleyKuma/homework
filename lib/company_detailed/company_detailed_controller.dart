import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/widget/base_getx_widget.dart';
import '../managers/favorite_manager.dart';
import '../../common/widget/modal_presenter.dart';
import '../../network/model/industry.dart';

class CompanyDetailedController extends BaseController {
  static const String ARG_INDUSTRY = "ARG_INDUSTRY";
  static Map<String, dynamic> genArgs({required Industry industry}) => {
        ARG_INDUSTRY: industry,
      };

  final argIndustry = Get.arguments[CompanyDetailedController.ARG_INDUSTRY] as Industry;
  final favoriteManager = Get.find<FavoriteManager>();
  final rxAppBarTitle = RxString('');

  Future<void> onVisitWebsite() async {
    final filePath = argIndustry.website;
    final uri = Uri.parse(filePath);
    if (!await launchUrl(uri)) {
      ModalPresenter.presentAlert(title: "Oops", content: "無法打開 $filePath");
    }
  }

  Future<void> onFavoriteTapped() async {
    String codename = argIndustry.companyCodename;
    if (favoriteManager.isAlreadyAddedToFavorite(codename)) {
      final option = await ModalPresenter.presentDialog(
        title: "從追蹤列表移除",
        content: "是否將 ${argIndustry.infoInShort} 從追蹤列表移除？",
        positiveText: "移除",
      );
      if (option == DialogOption.positive) {
        await favoriteManager.removeFromFavorite(codename);
        ModalPresenter.presentAlert(title: "成功", content: "已成功移除");
      }
    } else {
      final option = await ModalPresenter.presentDialog(
        title: "加入追蹤列表",
        content: "是否將 ${argIndustry.infoInShort} 加入追蹤列表內？",
        positiveText: "加入",
      );
      if (option == DialogOption.positive) {
        await favoriteManager.addToFavorite(codename);
        ModalPresenter.presentAlert(title: "成功", content: "已成功加入");
      }
    }
  }
}
