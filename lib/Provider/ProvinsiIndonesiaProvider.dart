import 'package:covid19app/Model/ProvinsiIndonesia_Model.dart';
import 'package:covid19app/Service/ProvinsiIndonesiaService.dart';
import 'package:flutter/material.dart';

class ProvinsiIndonesiaProvider with ChangeNotifier {
  ProvinsiIndonesiaService _provinsiIndonesiaService =
      const ProvinsiIndonesiaService();

  String _searchProvinsi = "";
  bool _isdecending = true;
  bool _isloading;
  String _sortBy = "Positif";

  String get searchProvinsi => _searchProvinsi;
  bool get isdescending => _isdecending;
  bool get isloading => _isloading;
  String get sortby => _sortBy;

  set setsearchprovinsi(String val) {
    _searchProvinsi = val;
    notifyListeners();
  }

  set setisDecending(bool val) {
    _isdecending = val;
    notifyListeners();
  }

  set setsortBy(String val) {
    _sortBy = val;
    notifyListeners();
  }

  Future<List<ListDatum>> getdataprovinsiIndonesia() async {
    var listprovinsi = List<ListDatum>();
    _isloading = true;
    listprovinsi =
        await _provinsiIndonesiaService.getdataprovinsi(_sortBy, _isdecending);
    final searchdata = listprovinsi
        .where((list) =>
            list.key.toLowerCase().contains(_searchProvinsi.toLowerCase()))
        .toList();
    _isloading = false;
    return searchdata;
  }
}
