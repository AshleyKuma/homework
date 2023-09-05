part of 'company_detailed_scene.dart';

class _CompanyDetailedSceneBuilder extends BaseSceneWidgetBuilder<_CompanyDetailedSceneState> {
  const _CompanyDetailedSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: state._argIndustry.industryType.desc),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          BaseWidget.header(title: "${state._argIndustry.companyCodename} ${state._argIndustry.companyNameShort}"),
          const SizedBox(height: 15),
          BaseWidget.detailedColumn(title: "基本資料", content: state._argIndustry.companyName),
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 0,
              runSpacing: 16,
              children: [
                _wrapWithFixedWidth("董事長", state._argIndustry.chairman),
                _wrapWithFixedWidth("總經理", state._argIndustry.ceo),
                _wrapWithFixedWidth("產業類別", state._argIndustry.industryType.desc),
                _wrapWithFixedWidth("公司成立日期", state._argIndustry.establishDate),
                _wrapWithFixedWidth("上市日期", state._argIndustry.releaseDate),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 16,
              children: [
                _wrapWithFixedWidth("總機", state._argIndustry.tel),
                _wrapWithFixedWidth("統一編號", state._argIndustry.guiNumber),
              ],
            ),
          ),
          BaseWidget.detailedColumn(title: "地址", content: state._argIndustry.address),
          const SizedBox(height: 5),
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 20),
          BaseWidget.detailedColumn(title: "實收資本額(元)", content: state._argIndustry.capitalAmount),
          BaseWidget.detailedColumn(title: "普通股每股面額", content: state._argIndustry.commonShareUnit),
          BaseWidget.detailedColumn(title: "已發行普通股數或TDR原股發行股數", content: state._argIndustry.issuedShare),
          BaseWidget.detailedColumn(title: "特別股", content: state._argIndustry.specialShare),
          const SafeArea(child: SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _wrapWithFixedWidth(String title, String content) => SizedBox(
        width: MediaQuery.of(state.context).size.width / 3 - 10,
        child: BaseWidget.detailedColumn(title: title, content: content),
      );
}
