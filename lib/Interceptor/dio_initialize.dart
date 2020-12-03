import 'package:connectivity/connectivity.dart';
import 'package:covid19app/Interceptor/dio_connectivity_request_retrier.dart';
import 'package:covid19app/Interceptor/retry_interceptor.dart';
import 'package:dio/dio.dart';

class DioInitialized {
  Dio dio = Dio();
  DioInitialized() {
    dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: dio,
          connectivity: Connectivity(),
        ),
      ),
    );
  }
}
