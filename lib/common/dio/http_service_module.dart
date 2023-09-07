import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HttpServiceModule extends Object {
  static const String tagHomework = "tagHomework";
  static const String baseUrl = "https://openapi.twse.com.tw/v1/opendata";

  Future<void> bind() async {
    Get.lazyPut(() {
      Dio epicLifeDio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ));
      epicLifeDio.options.baseUrl = baseUrl;
      return epicLifeDio;
    }, tag: tagHomework, fenix: true);
  }
}
