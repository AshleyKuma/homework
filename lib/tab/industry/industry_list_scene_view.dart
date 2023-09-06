part of 'industry_list_scene.dart';

class _IndustryListSceneBuilder extends BaseSceneWidgetBuilder<_IndustryListSceneState> {
  const _IndustryListSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Scaffold(
      // appBar: BaseAppBar(title: "產業別", showBackButton: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: BaseWidget.header(title: "產業別"),
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
            final data = state._getCompanyListController.companiesForDisplay;
            if (data.isEmpty) {
              return BaseWidget.emptyView;
            }
            final industryTypeList = IndustryType.values.where((e) => e != IndustryType.unknown).map((type) {
              final currentType = data.firstWhereOrNull((e) => e.industryType == type);
              int currentTypeCount = currentType == null ? 0 : currentType.companyCount;
              return BaseWidget.cell(
                text: "${type.desc} ($currentTypeCount)",
                onTap: () => state._onGoToCompanyList(currentType),
              );
            }).toList();
            return ListView(padding: EdgeInsets.zero, children: industryTypeList);
          },
          orElse: () => BaseWidget.emptyView,
          error: (_) => BaseWidget.emptyView,
        );
      });
}
