import 'package:covid19app/Interceptor/dio_initialize.dart';
import 'package:covid19app/Model/ProvinsiIndonesia_Model.dart';
import 'package:dio/dio.dart';

class ProvinsiIndonesiaService {
  const ProvinsiIndonesiaService();

  Future<ProvinsiIndonesia> getdatafromAPI() async {
    DioInitialized _initialized = DioInitialized();
    Response response = await _initialized.dio
        .get("https://data.covid19.go.id/public/api/prov.json");
    Map<String, dynamic> responsedata = response.data;
    ProvinsiIndonesia data = ProvinsiIndonesia.fromJson(responsedata);
    return data;
  }

  Future<List<ListDatum>> getdataprovinsi(String sortby, bool isdesc) async {
    ProvinsiIndonesia dataAPI = await getdatafromAPI();
    return sortdata(dataAPI.listData, sortby, isdesc);
  }

  List<ListDatum> sortdata(
      List<ListDatum> listdata, String sortBy, bool isDesc) {
    List<ListDatum> sortlist = listdata;
    if (sortBy == "Positif") {
      sortlist.sort((x, y) => x.jumlahKasus.compareTo(y.jumlahKasus));
    } else if (sortBy == "Meninggal") {
      sortlist.sort((x, y) => x.jumlahMeninggal.compareTo(y.jumlahMeninggal));
    } else if (sortBy == "Sembuh") {
      sortlist.sort((x, y) => x.jumlahSembuh.compareTo(y.jumlahSembuh));
    } else if (sortBy == "Alfabet") {
      sortlist.sort((x, y) => x.key.compareTo(y.key));
    } else if (sortBy == "Dirawat") {
      sortlist.sort((x, y) => x.jumlahDirawat.compareTo(y.jumlahDirawat));
    }
    if (isDesc) {
      return sortlist.reversed.toList();
    }
    return sortlist;
  }
}
