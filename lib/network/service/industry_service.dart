import 'package:dio/dio.dart';
import 'package:homework/network/model/industry.dart';
import 'package:retrofit/retrofit.dart';

part 'industry_service.g.dart';

@RestApi()
abstract class IndustryService {
  factory IndustryService(Dio dio) => _IndustryService(dio);

  @GET("/opendata/t187ap03_P")
  Future<List<Industry>> getIndustryList();

  @GET("/opendata/t187ap03_L")
  Future<List<Industry>> getCompanyList();
}
