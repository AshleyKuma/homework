part of 'company_list_scene.dart';

class _CompanyListSceneBuilder extends BaseSceneWidgetBuilder<_CompanyListSceneState> {
  const _CompanyListSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: state._argIndustryType.desc),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          ...state._companies
              .map((e) => BaseWidget.cell(
                    text: "${e.companyCodename} ${e.companyNameShort}",
                    onTap: () => state._onGoToCompanyDetail(e),
                  ))
              .toList(),
          const SizedBox(height: 15),
          const SafeArea(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
