import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/common/extension/extension.dart';

import '../common/widget/base_getx_widget.dart';
import '../../common/widget/base_widget.dart';
import '../../network/model/industry.dart';
import '../common/widget/base_app_bar.dart';
import '../company_detailed/company_detailed_controller.dart';

class CompanyDetailedView extends BaseView<CompanyDetailedController> {
  CompanyDetailedView({super.key});

  Industry get model => controller.argIndustry;
  final _scrollController = ScrollController();

  @override
  CompanyDetailedController createController() => CompanyDetailedController();

  @override
  Widget sceneWidget(BuildContext context) => Scaffold(
        appBar: CompanyDetailedAppBar(
          title: model.industryType.desc,
          centerTitle: Obx(() => Text(controller.rxAppBarTitle.value, style: const TextStyle(color: Colors.black))),
          actions: [
            InkWell(
              onTap: controller.onFavoriteTapped,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Obx(() {
                  return Icon(
                    controller.favoriteManager.isAlreadyAddedToFavorite(model.companyCodename) ? Icons.star : Icons.star_border,
                    color: Colors.black,
                  );
                }),
              ),
            )
          ],
        ),
        body: NotificationListener(
          onNotification: (t) {
            /// 根據頁面滾動的所在位置決定是否要顯示動態 AppBarTitle
            if (_scrollController.position.pixels > 0) {
              controller.rxAppBarTitle.value = model.infoInShort;
            } else {
              controller.rxAppBarTitle.value = "";
            }
            controller.rxAppBarTitle.refresh();
            return true;
          },
          child: _body,
        ),
      );

  Widget get _body => ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          BaseWidget.header(title: model.infoInShort),
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
                _wrapWithFixedWidth("董事長", model.chairman),
                _wrapWithFixedWidth("總經理", model.ceo),
                _wrapWithFixedWidth("產業類別", model.industryType.desc),
                _wrapWithFixedWidth("公司成立日期", DateTime.parse(model.establishDate).format(DateTimeFormat.dateFormatWithSlash)),
                _wrapWithFixedWidth("上市日期", DateTime.parse(model.listingDate).format(DateTimeFormat.dateFormatWithSlash)),
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
                _wrapWithFixedWidth("總機", model.tel),
                _wrapWithFixedWidth("統一編號", model.guiNumber),
              ],
            ),
          ),
          BaseWidget.detailedColumn(title: "地址", content: model.address),
          const SizedBox(height: 5),
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 20),
          BaseWidget.detailedColumn(title: "實收資本額(元)", content: model.capitalAmount.numberFormat, suffix: "元"),
          BaseWidget.detailedColumn(title: "普通股每股面額", content: model.commonShareUnit),

          /// Spec 上有註明此欄位的計算公式，但從 API 拉回來已經包含此欄位，所以不另做計算
          BaseWidget.detailedColumn(title: "已發行普通股數或TDR原股發行股數", content: model.issuedShare.numberFormat, suffix: "股"),
          BaseWidget.detailedColumn(title: "特別股", content: model.specialShare.numberFormat, suffix: "股"),
          const SafeArea(child: SizedBox.shrink()),
        ],
      );

  Widget _wrapWithFixedWidth(String title, String content) => SizedBox(
        width: Get.width / 3 - 10,
        child: BaseWidget.detailedColumn(title: title, content: content),
      );

  Widget get _companyHeader {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("基本資料", style: TextStyle(color: Colors.grey, fontSize: 15)),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: model.clickable ? controller.onVisitWebsite : null,
          child: Row(
            children: [
              Text(model.companyName,
                  style: TextStyle(
                    color: model.clickable ? Colors.blue : Colors.black,
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
