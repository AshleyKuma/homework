import 'package:get/get.dart';

import '../../app_routes.dart';
import '../../common/widget/base_getx_widget.dart';
import '../../common/widget/modal_presenter.dart';
import '../../company/company_controller.dart';
import '../../managers/industry_manager.dart';
import '../../network/model/industry_display_model.dart';

class IndustryController extends BaseController {
  final industryManager = Get.find<IndustryManager>();

  Future<void> onGoToCompanyList(IndustryDisplayModel? model) async {
    /// 若產業別無任何上市資料，則停留在此，不進入下一步
    if (model == null) {
      ModalPresenter.presentAlert(title: "Oops", content: "此產業別沒有上市公司資料");
      return;
    }
    Get.toNamed(AppRoutes.Company, arguments: CompanyController.genArgs(type: model.industryType));
  }
}
