part of 'company_list_scene.dart';

class _CompanyListSceneBuilder extends BaseSceneWidgetBuilder<_CompanyListSceneState> {
  const _CompanyListSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "123123"),
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
        return state._getCompanyListController.apiResultState.maybeWhen<Widget>(
          success: (result) => ListView(
              children: result
                  .map((e) => BaseWidget.cell(
                        text: "123123",
                        onTap: null,
                      ))
                  .toList()),
          orElse: () => const SizedBox.shrink(),
        );
      });
}
