import 'package:dio/dio.dart';
import 'package:homework/network/model/industry.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class APIService {
  factory APIService(Dio dio) => _APIService(dio);

  @GET("/opendata/t187ap03_P")
  Future<List<Industry>> getIndustryList();

  @GET("/opendata/t187ap03_L")
  Future<List<Industry>> getCompanyList();
}
