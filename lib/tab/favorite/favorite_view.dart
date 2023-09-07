import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';

import '../../common/widget/base_getx_widget.dart';
import '../../common/widget/base_widget.dart';
import 'favorite_controller.dart';

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
        return controller.industryManager.apiResultState.maybeWhen(
          loading: (_) => const SizedBox.shrink(),
          success: (_) {
            final favoriteList = controller.favoriteManager.favorites.map((codename) {
              final company = controller.industryManager.companies.firstWhereOrNull((e) => e.companyCodename == codename);
              if (company == null) return const SizedBox.shrink();

              final cell = SwipeActionCell(
                key: ObjectKey(company.infoInShort),
                trailingActions: <SwipeAction>[
                  SwipeAction(
                    title: "移除",
                    onTap: (CompletionHandler handler) async {
                      final deleted = await controller.onSwiftLeft(company);
                      deleted ? await handler(true) : await handler(false);
                    },
                    color: Colors.grey,
                  )
                ],
                child: BaseWidget.cell(
                  text: "${company.companyCodename} ${company.companyNameShort}",
                  onTap: () => controller.onGoToCompanyDetail(company),
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
