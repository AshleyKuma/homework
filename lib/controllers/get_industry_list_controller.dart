import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:homework/network/model/industry.dart';

import '../common/dio/http_service_module.dart';
import '../network/api_result_state.dart';
import '../network/model/industry_model.dart';
import '../network/service/api_service.dart';

class GetIndustryListController extends GetxController {
  final service = APIService(Get.find<Dio>(tag: HttpServiceModule.tagHomework));

  final rxApiResultState = Rx<ApiResultState<List<IndustryModel>>>(const ApiResultState.idle());
  ApiResultState<List<IndustryModel>> get apiResultState => rxApiResultState.value;

  final _rxIndustries = RxList<Industry>(const []);
  List<Industry> get industries => _rxIndustries;
  set industries(List<Industry> value) => _rxIndustries.value = value;

  final _rxIndustryModel = RxList<IndustryModel>(const []);
  List<IndustryModel> get industryModel => _rxIndustryModel;
  set industryModel(List<IndustryModel> value) => _rxIndustryModel.value = value;

  StreamSubscription<ApiResultState<List<IndustryModel>>> Function(
    void Function(ApiResultState<List<IndustryModel>>), {
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
      _rxIndustries.value = response.where((e) => e.industryType != IndustryType.unknown).toList();
      await _processIndustryModel();
      rxApiResultState.value = ApiResultState.success(result: _rxIndustryModel);
    } catch (err) {
      if (err is DioException && err.type == DioExceptionType.cancel) {
        rxApiResultState.value = const ApiResultState.idle();
        return;
      }
      rxApiResultState.value = const ApiResultState.error();
    }
  }

  Future<void> _processIndustryModel() async {
    final data = <IndustryModel>[];
    for (var type in IndustryType.values) {
      if (type == IndustryType.unknown) break;
      data.add(
        IndustryModel(
          industryType: type,
          companyCount: industries.where((e) => e.industryType == type).toList().length,
        ),
      );
    }
    _rxIndustryModel.value = data;
  }
}
