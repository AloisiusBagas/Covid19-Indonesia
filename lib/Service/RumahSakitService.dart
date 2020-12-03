import 'package:covid19app/Interceptor/dio_initialize.dart';
import 'package:covid19app/Model/RumahSakit_Model.dart';
import 'package:dio/dio.dart';

class RumahsakitService {
  const RumahsakitService();

  Future<List<RumahSakit>> getdatafromAPI() async {
    DioInitialized _initialized = DioInitialized();
    Response response = await _initialized.dio
        .get("https://dekontaminasi.com/api/id/covid19/hospitals");
    final data = rumahSakitFromJson(response.data);
    return data;
  }
}
