part of 'industry_list_scene.dart';

class _IndustryListSceneBuilder extends BaseSceneWidgetBuilder<_IndustryListSceneState> {
  const _IndustryListSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "產業別", showBackButton: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Expanded(child: industryList),
          const SizedBox(height: 15),
          const SafeArea(child: SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget get industryList => Obx(() {
        return state._getIndustryListController.apiResultState.maybeWhen<Widget>(
          success: (result) => ListView(
              children: result
                  .map((e) => BaseWidget.cell(
                        text: "${e.industryType.desc} (${e.companyCount.toString()})",
                        onTap: () => state._onGoToCompanyList(e),
                      ))
                  .toList()),
          orElse: () => const SizedBox.shrink(),
          error: (_) => Center(
            child: Container(
                width: 100,
                height: 50,
                color: Colors.grey,
                child: GestureDetector(
                  onTap: state._onTryAgain,
                  child: const Center(child: Text("再試一次")),
                )),
          ),
        );
      });
}
