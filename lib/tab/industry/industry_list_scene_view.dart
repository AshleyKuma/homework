part of 'industry_list_scene.dart';

class _IndustryListSceneBuilder extends BaseSceneWidgetBuilder<_IndustryListSceneState> {
  const _IndustryListSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "產業別"),
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
          success: (result) => ListView(children: result.map((e) => _cell(model: e)).toList()),
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

  Widget _cell({required IndustryModel model}) => GestureDetector(
        onTap: state._onCompanyList,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Container(
            height: 50,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${model.industryType.desc} (${model.companyCount.toString()})"),
                const Icon(Icons.navigate_next),
              ],
            ),
          ),
        ),
      );
}
