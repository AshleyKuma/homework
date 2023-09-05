import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:homework/network/model/industry.dart';

import '../common/dio/http_service_module.dart';
import '../network/api_result_state.dart';
import '../network/service/industry_service.dart';

class GetIndustryListController extends GetxController {
  final service = IndustryService(Get.find<Dio>(tag: HttpServiceModule.tagHomework));

  final rxApiResultState = Rx<ApiResultState<List<Industry>>>(const ApiResultState.idle());
  ApiResultState<List<Industry>> get apiResultState => rxApiResultState.value;

  final _rxIndustries = RxList<Industry>(const []);
  List<Industry> get industries => _rxIndustries;
  set industries(List<Industry> value) => _rxIndustries.value = value;

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

  Future<void> getIndustryList() async {
    if (apiResultState is ApiResultStateLoading) return;

    final cancelToken = CancelToken();
    rxApiResultState.value = ApiResultState.loading(cancelToken: cancelToken);

    try {
      final response = await service.getIndustryList();
      _rxIndustries.value = response;
      rxApiResultState.value = ApiResultState.success(result: response);
    } catch (err) {
      if (err is DioException && err.type == DioExceptionType.cancel) {
        rxApiResultState.value = const ApiResultState.idle();
        return;
      }
      rxApiResultState.value = const ApiResultState.error();
    }
  }
}
