part of 'favorite_list_scene.dart';

class _FavoriteListSceneBuilder extends BaseSceneWidgetBuilder<_FavoriteListSceneState> {
  const _FavoriteListSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Scaffold(
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
  }

  Widget get _list => Obx(() {
        return state._getCompanyListController.apiResultState.maybeWhen(
          loading: (_) => const SizedBox.shrink(),
          success: (_) {
            final favoriteList = state._favoriteManager.favorites.map((codename) {
              final company = state._getCompanyListController.companies.firstWhereOrNull((e) => e.companyCodename == codename);
              if (company == null) return const SizedBox.shrink();

              final cell = SwipeActionCell(
                key: ObjectKey(company.infoInShort),
                trailingActions: <SwipeAction>[
                  SwipeAction(
                    title: "移除",
                    onTap: (CompletionHandler handler) async {
                      final deleted = await state._onSwiftLeft(company);
                      deleted ? await handler(true) : await handler(false);
                    },
                    color: Colors.grey,
                  )
                ],
                child: BaseWidget.cell(
                  text: "${company.companyCodename} ${company.companyNameShort}",
                  onTap: () => state._onGoToCompanyDetail(company),
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
