import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HttpServiceModule extends Object {
  static const String tagHomework = "TAG_HOMEWORK";

  Future<void> bind() async {
    /// dio
    Get.lazyPut(() {
      Dio epicLifeDio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ));
      epicLifeDio.options.baseUrl = "https://openapi.twse.com.tw/v1/opendata";
      return epicLifeDio;
    }, tag: tagHomework, fenix: true);
  }
}
