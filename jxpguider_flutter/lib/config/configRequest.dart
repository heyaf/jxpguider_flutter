import 'package:dio/dio.dart';
import 'package:jxpguider_flutter/config/configUrl.dart';

class HttpRequest {
  static final BaseOptions options =
      BaseOptions(baseUrl: baseUrl, connectTimeout: 5000);
  static final Dio dio = Dio(options);

  static Future<T> request<T>(String url,
      {String method = 'get',
      Map<String, dynamic> params,
      Interceptor inter}) async {
    // 1.请求的单独配置
    final options = Options(method: method);

    // 2.添加第一个拦截器
    Interceptor dInter =
        InterceptorsWrapper(onRequest: (RequestOptions options) {
      // 1.在进行任何网络请求的时候, 可以添加一个loading显示

      // 2.很多页面的访问必须要求携带Token,那么就可以在这里判断是有Token

      // 3.对参数进行一些处理,比如序列化处理等
      return options;
    }, onResponse: (Response response) {
      print('response-----$response');

      return response;
    }, onError: (DioError error) {
      print('error-----$error');
      return error;
    });
    List<Interceptor> inters = [dInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    // 3.发送网络请求
    try {
      Response response =
          await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
