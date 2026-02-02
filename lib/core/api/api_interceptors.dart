import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-api-key'] ="aec08c756a204ee699765682625180e8";
   // 1e7cc8b1b3ef4bae864c0999daddc524
    super.onRequest(options, handler);
  }
}
