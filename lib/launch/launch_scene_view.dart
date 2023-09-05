part of 'launch_scene.dart';

class _LaunchSceneBuilder extends BaseSceneWidgetBuilder<_LaunchSceneState> {
  const _LaunchSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return state._getIndustryListController.apiResultState.maybeWhen<Widget>(
          success: (result) {
            return ListView(children: result.map((e) => content(e)).toList());
          },
          orElse: () => const SizedBox.shrink(),
          error: (_) => Center(
            child: Container(
                width: 100,
                height: 50,
                color: Colors.grey,
                child: GestureDetector(
                  onTap: state._onTryAgain,
                  child: const Text("再試一次"),
                )),
          ),
        );
      }),
    );
  }

  Widget content(Industry industry) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(color: Colors.amberAccent, child: Text(industry.companyName)),
    );
  }
}
