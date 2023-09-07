import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:homework/company/company_detail_view.dart';

import '../../app_routes.dart';
import '../../common/widget/base_getx_widget.dart';
import '../../managers/favorite_manager.dart';
import '../../common/widget/base_widget.dart';
import '../../common/widget/modal_presenter.dart';
import '../../managers/industry_manager.dart';
import '../../network/model/industry.dart';

class FavoriteController extends BaseController {
  final _favoriteManager = Get.find<FavoriteManager>();
  final _industryManager = Get.find<IndustryManager>();

  Future<void> _onGoToCompanyDetail(Industry industry) async {
    Get.toNamed(AppRoutes.CompanyDetailed,
        arguments: CompanyDetailedController.genArgs(
          industry: industry,
        ));
  }

  Future<bool> _onSwiftLeft(Industry industry) async {
    final option = await ModalPresenter.presentDialog(
      title: "從追蹤列表移除",
      content: "是否將 ${industry.infoInShort} 從追蹤列表移除？",
      positiveText: "移除",
    );
    if (option == DialogOption.positive) {
      _favoriteManager.removeFromFavorite(industry.companyCodename);
      return true;
    }
    return false;
  }
}

class FavoriteView extends BaseView<FavoriteController> {
  FavoriteView({super.key});

  @override
  FavoriteController createController() => FavoriteController();

  @override
  Widget sceneWidget(BuildContext context) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: BaseWidget.header(title: "追蹤"),
            ),
            const SizedBox(height: 15),
            Expanded(child: _list),
            const SizedBox(height: 15),
          ],
        ),
      );

  Widget get _list => Obx(() {
        return controller._industryManager.apiResultState.maybeWhen(
          loading: (_) => const SizedBox.shrink(),
          success: (_) {
            final favoriteList = controller._favoriteManager.favorites.map((codename) {
              final company = controller._industryManager.companies.firstWhereOrNull((e) => e.companyCodename == codename);
              if (company == null) return const SizedBox.shrink();

              final cell = SwipeActionCell(
                key: ObjectKey(company.infoInShort),
                trailingActions: <SwipeAction>[
                  SwipeAction(
                    title: "移除",
                    onTap: (CompletionHandler handler) async {
                      final deleted = await controller._onSwiftLeft(company);
                      deleted ? await handler(true) : await handler(false);
                    },
                    color: Colors.grey,
                  )
                ],
                child: BaseWidget.cell(
                  text: "${company.companyCodename} ${company.companyNameShort}",
                  onTap: () => controller._onGoToCompanyDetail(company),
                ),
              );
              return cell;
            }).toList();
            if (favoriteList.isEmpty) {
              return BaseWidget.emptyView;
            }
            return ListView(padding: EdgeInsets.zero, children: favoriteList);
          },
          orElse: () => BaseWidget.emptyView,
          error: (_) => BaseWidget.emptyView,
        );
      });
}
