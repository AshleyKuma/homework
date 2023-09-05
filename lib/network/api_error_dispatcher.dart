import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<void> epicApiErrorDispatcher({
  required Future<void> Function() run,
  required void Function() fallback,
  void Function(DioException err)? onDioError,
  void Function(Object err)? onError,
}) async {
  try {
    await run();
  } catch (err) {
    if (err is TypeError) {
      if (kDebugMode) {
        rethrow;
      }
    }
    if (err is DioException) {
      if (err.type == DioExceptionType.cancel) {
        fallback();
        return;
      }
      if (onDioError != null) {
        onDioError.call(err);
        return;
      }
    }
    if (onError == null) rethrow;
    onError.call(err);
  }
}
