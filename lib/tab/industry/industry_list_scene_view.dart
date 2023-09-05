part of 'industry_list_scene.dart';

class _IndustryListSceneBuilder extends BaseSceneWidgetBuilder<_IndustryListSceneState> {
  const _IndustryListSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Scaffold(
      body: abc,
    );
  }

  Widget get abc => Obx(() {
        return state._getIndustryListController.apiResultState.maybeWhen<Widget>(
          success: (result) {
            return ListView(children: result.where((e) => e.industryType != IndustryType.unknown).map((e) => content(e)).toList());
          },
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

  Widget content(Industry industry) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(color: Colors.amberAccent, child: Text(industry.industryType.desc)),
    );
  }
}
