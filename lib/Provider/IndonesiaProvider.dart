import 'package:covid19app/Model/Indonesia_Model.dart';
import 'package:covid19app/Service/IndonesiaService.dart';
import 'package:flutter/material.dart';

class IndonesiaProvider with ChangeNotifier {
  IndonesiaService _indonesiaService = const IndonesiaService();

  Future<Indonesia> getdataIndonesia() async {
    return await _indonesiaService.getdataFromAPI();
  }
}
