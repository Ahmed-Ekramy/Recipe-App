import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-api-key'] ="31545f1a3c2c4c3dac7f4133648b02fc";
    super.onRequest(options, handler);
  }
}
