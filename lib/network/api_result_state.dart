import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result_state.freezed.dart';

@freezed
class ApiResultState<T> with _$ApiResultState<T> {
  const ApiResultState._();

  const factory ApiResultState.idle() = ApiResultStateIdle;

  const factory ApiResultState.loading({
    required CancelToken cancelToken,
  }) = ApiResultStateLoading;

  const factory ApiResultState.success({
    required T result,
  }) = ApiResultStateSuccess;

  const factory ApiResultState.error({
    String? message,
  }) = ApiResultStateError;
}
