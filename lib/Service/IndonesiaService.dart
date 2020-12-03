import 'package:covid19app/Interceptor/dio_initialize.dart';
import 'package:covid19app/Model/Indonesia_Model.dart';
import 'package:dio/dio.dart';

class IndonesiaService {
  const IndonesiaService();

  Future<Indonesia> getdataFromAPI() async {
    DioInitialized _initialized = DioInitialized();
    Response response = await _initialized.dio
        .get("https://data.covid19.go.id/public/api/update.json");
    Map<String, dynamic> responsedata = response.data;
    Indonesia data = Indonesia.fromJson(responsedata);
    return data;
  }

  Future<List<Harian>> getupdateharianIndonesia() async {
    Indonesia dataAPI = await getdataFromAPI();
    List dataharian = dataAPI.update.harian;
    List<Harian> data = dataharian.map((e) => Harian.fromJson(e)).toList();
    return data;
  }
}
