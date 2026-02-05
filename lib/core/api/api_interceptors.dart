import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-api-key'] ="1e7cc8b1b3ef4bae864c0999daddc524";
    //dad "aec08c756a204ee699765682625180e8";
   //me 1e7cc8b1b3ef4bae864c0999daddc524
   //mam 55c748241b27415ca1a5810624d8c091
    super.onRequest(options, handler);
  }
}
