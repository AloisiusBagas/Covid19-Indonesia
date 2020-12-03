import 'package:covid19app/Model/ProvinsiIndonesia_Model.dart';
import 'package:covid19app/Pages/Kasus%20Provinsi/Detail%20Provinsi/Component/Grafik_Umur.dart';
import 'package:covid19app/Pages/Kasus%20Provinsi/Detail%20Provinsi/Component/Grafik_gender.dart';
import 'package:covid19app/contstant/Appbar_template.dart';
import 'package:flutter/material.dart';
import 'Component/Status_Provinsi.dart';

class DetailprovinsiPage extends StatelessWidget {
  final ListDatum dataprovinsi;

  const DetailprovinsiPage({Key key, this.dataprovinsi}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppbar(
          title: "Detail Provinsi",
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      StatusProvinsi(dataprovinsi: dataprovinsi),
                      GrafikGender(datagender: dataprovinsi.jenisKelamin),
                      GrafikUmur(dataumur: dataprovinsi.kelompokUmur)
                    ],
                  )
                ],
              ),
              // GrafikStatistik(
              //   jumlahDirawat: dataprovinsi.jumlahDirawat,
              //   jumlahKasus: dataprovinsi.jumlahKasus,
              //   jumlahMeninggal: dataprovinsi.jumlahMeninggal,
              //   jumlahSembuh: dataprovinsi.jumlahSembuh,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
