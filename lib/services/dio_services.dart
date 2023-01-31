import 'package:dio/dio.dart';
import 'package:sociout/utils/url.dart';

class DioServices {
  // Future<Dio> dios =  Interceptorapi().getApiUser();
  static final dio = Dio(BaseOptions(
    baseUrl: Url().baseUrl,
  ));

  static Future<Response<dynamic>> postFunction(
      {required String url, required value}) async {
    return await dio.post(url, data: value).then((value) {
      return value;
    });
  }

  static Future<Response> getFunction(
      {required String url, required value}) async {
    return await dio.get(url).then((value) {
      return value;
    });
  }
}
