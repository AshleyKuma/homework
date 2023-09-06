import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:homework/network/model/industry.dart';

import '../common/dio/http_service_module.dart';
import '../network/api_result_state.dart';
import '../network/model/industry_display_model.dart';
import '../network/service/api_service.dart';

class GetCompanyListController extends GetxController {
  final service = APIService(Get.find<Dio>(tag: HttpServiceModule.tagHomework));

  final rxApiResultState = Rx<ApiResultState<List<IndustryDisplayModel>>>(const ApiResultState.idle());
  ApiResultState<List<IndustryDisplayModel>> get apiResultState => rxApiResultState.value;

  /// api 回傳的原始資料
  final _rxCompanies = RxList<Industry>(const []);
  List<Industry> get companies => _rxCompanies;
  set companies(List<Industry> value) => _rxCompanies.value = value;

  /// 產業別頁面需要顯示的 model
  final _rxCompaniesForDisplay = RxList<IndustryDisplayModel>(const []);
  List<IndustryDisplayModel> get companiesForDisplay => _rxCompaniesForDisplay;
  set companiesForDisplay(List<IndustryDisplayModel> value) => _rxCompaniesForDisplay.value = value;

  List<Industry> getCompaniesByIndustryType(IndustryType type) => companies.where((e) => e.industryType == type).toList();

  StreamSubscription<ApiResultState<List<IndustryDisplayModel>>> Function(
    void Function(ApiResultState<List<IndustryDisplayModel>>), {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) get apiResultStateListener => rxApiResultState.listen;

  @override
  void onClose() {
    if (apiResultState is ApiResultStateLoading) {
      (apiResultState as ApiResultStateLoading).cancelToken.cancel();
    }
    super.onClose();
  }

  Future<void> getCompanyList() async {
    if (apiResultState is ApiResultStateLoading) return;

    final cancelToken = CancelToken();
    rxApiResultState.value = ApiResultState.loading(cancelToken: cancelToken);

    try {
      final response = await service.getCompanyList();
      _rxCompanies.value = response.where((e) => e.industryType != IndustryType.unknown).toList();

      /// Group by 產業別
      var groupByIndustryType = groupBy(response, (obj) => obj.industryType);
      groupByIndustryType.removeWhere((key, value) => key == IndustryType.unknown);

      // groupByIndustryType.keys.forEach((e) {
      //   print("type: ${e.desc} count: ${groupByIndustryType[e]?.length}");
      // });

      _rxCompaniesForDisplay.value = groupByIndustryType.keys
          .map((e) => IndustryDisplayModel(
                industryType: e,
                companyCount: groupByIndustryType[e]!.length,
              ))
          .toList();

      rxApiResultState.value = ApiResultState.success(result: _rxCompaniesForDisplay);
    } catch (err) {
      if (err is DioException && err.type == DioExceptionType.cancel) {
        rxApiResultState.value = const ApiResultState.idle();
        return;
      }
      rxApiResultState.value = const ApiResultState.error();
    }
  }
}
