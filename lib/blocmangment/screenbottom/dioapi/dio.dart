import 'package:dio/dio.dart';

// https://newsapi.org/
//v2/everything
//?q=apple&from=2022-03-21&to=2022-03-21&sortBy=popularity&apiKey=b739f2cf151342dfbaee6b6c9b010d8a

class Diohilper {
  static Dio? dio;

  static initdio() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  static Future<Response> getfromapi(
      {required String path, required Map<String, dynamic> qury}) async {
    // ignore: void_checks
    return await dio!.get(path, queryParameters: qury);
  }
}
