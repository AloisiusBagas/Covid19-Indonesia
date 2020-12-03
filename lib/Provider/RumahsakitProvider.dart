import 'package:covid19app/Model/RumahSakit_Model.dart';
import 'package:covid19app/Service/RumahSakitService.dart';
import 'package:flutter/cupertino.dart';

class RumahsakitProvider with ChangeNotifier {
  RumahsakitService _rumahsakitService = const RumahsakitService();

  bool _isloading = false;
  String _searchRumahsakit = "";

  bool get isloading => _isloading;
  String get searchRumahSakit => _searchRumahsakit;

  set setsearchrumahsakit(String val) {
    _searchRumahsakit = val;
    notifyListeners();
  }

  Future<List<RumahSakit>> getdataRumahSakit() async {
    var listrumahsakit = List<RumahSakit>();
    _isloading = true;
    listrumahsakit = await _rumahsakitService.getdatafromAPI();
    final searchdata = listrumahsakit
        .where((list) =>
            list.province
                .toLowerCase()
                .contains(_searchRumahsakit.toLowerCase()) ||
            list.region.toLowerCase().contains(_searchRumahsakit.toLowerCase()))
        .toList();
    _isloading = false;
    return searchdata;
  }
}
