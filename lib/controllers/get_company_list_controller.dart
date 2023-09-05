import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:homework/network/model/industry.dart';

import '../common/dio/http_service_module.dart';
import '../network/api_result_state.dart';
import '../network/service/api_service.dart';

class GetCompanyListController extends GetxController {
  final service = APIService(Get.find<Dio>(tag: HttpServiceModule.tagHomework));

  final rxApiResultState = Rx<ApiResultState<List<Industry>>>(const ApiResultState.idle());
  ApiResultState<List<Industry>> get apiResultState => rxApiResultState.value;

  final _rxCompanies = RxList<Industry>(const []);
  List<Industry> get companies => _rxCompanies;
  set companies(List<Industry> value) => _rxCompanies.value = value;

  List<Industry> getCompaniesByIndustryType(IndustryType type) => companies.where((e) => e.industryType == type).toList();

  StreamSubscription<ApiResultState<List<Industry>>> Function(
    void Function(ApiResultState<List<Industry>>), {
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
      rxApiResultState.value = ApiResultState.success(result: _rxCompanies);
    } catch (err) {
      if (err is DioException && err.type == DioExceptionType.cancel) {
        rxApiResultState.value = const ApiResultState.idle();
        return;
      }
      rxApiResultState.value = const ApiResultState.error();
    }
  }
}
