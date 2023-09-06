part of 'company_detailed_scene.dart';

class _CompanyDetailedSceneBuilder extends BaseSceneWidgetBuilder<_CompanyDetailedSceneState> {
  const _CompanyDetailedSceneBuilder(super.state);

  @override
  Widget sceneWidget(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: state._argIndustry.industryType.desc,
        actions: [
          InkWell(
            onTap: state._onAddToFavorite,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Obx(() {
                return Icon(
                  state._favoriteManager.isAlreadyAddedToFavorite(state._argIndustry.companyCodename) ? Icons.star : Icons.star_border,
                  color: Colors.black,
                );
              }),
            ),
          )
        ],
      ),
      body: abc,
    );
  }

  Widget get abc => NotificationListener(
        onNotification: (t) {
          if (t is ScrollEndNotification) {
            print(state._scrollController.position.pixels);
          }
          return true;
        },
        child: _body,
      );

  Widget get _body => ListView(
        controller: state._scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          BaseWidget.header(title: "${state._argIndustry.companyCodename} ${state._argIndustry.companyNameShort}"),
          const SizedBox(height: 15),
          _companyHeader,
          const SizedBox(height: 15),
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
                _wrapWithFixedWidth("公司成立日期", DateTime.parse(state._argIndustry.establishDate).format(DateTimeFormat.dateFormatWithSlash)),
                _wrapWithFixedWidth("上市日期", DateTime.parse(state._argIndustry.listingDate).format(DateTimeFormat.dateFormatWithSlash)),
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
          BaseWidget.detailedColumn(title: "實收資本額(元)", content: state._argIndustry.capitalAmount.numberFormat, suffix: "元"),
          BaseWidget.detailedColumn(title: "普通股每股面額", content: state._argIndustry.commonShareUnit),

          /// Spec 上有註明此欄位的計算公式，但從 api 拉回來已經包含此欄位，所以不另做計算。
          BaseWidget.detailedColumn(title: "已發行普通股數或TDR原股發行股數", content: state._argIndustry.issuedShare.numberFormat, suffix: "股"),
          BaseWidget.detailedColumn(title: "特別股", content: state._argIndustry.specialShare.numberFormat, suffix: "股"),
          Container(color: Colors.grey, height: 500),
          const SafeArea(child: SizedBox.shrink()),
        ],
      );

  Widget _wrapWithFixedWidth(String title, String content) => SizedBox(
        width: MediaQuery.of(state.context).size.width / 3 - 10,
        child: BaseWidget.detailedColumn(title: title, content: content),
      );

  Widget get _companyHeader {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("基本資料", style: TextStyle(color: Colors.grey, fontSize: 15)),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: state._argIndustry.clickable ? state._onVisitWebsite : null,
          child: Row(
            children: [
              Text(state._argIndustry.companyName,
                  style: TextStyle(
                    color: state._argIndustry.clickable ? Colors.blue : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(width: 10),
              const Icon(Icons.public),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
