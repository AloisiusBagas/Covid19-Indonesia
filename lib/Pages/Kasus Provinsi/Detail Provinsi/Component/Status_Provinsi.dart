import 'package:covid19app/Model/ProvinsiIndonesia_Model.dart';
import 'package:covid19app/contstant/ColorTemplate.dart';
import 'package:flutter/material.dart';

class StatusProvinsi extends StatelessWidget {
  const StatusProvinsi({
    Key key,
    @required this.dataprovinsi,
  }) : super(key: key);

  final ListDatum dataprovinsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 30, 18, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 6,
            offset: Offset(0, 6), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: darkpurple,
              padding: EdgeInsets.only(left: 12, top: 14, bottom: 14),
              child: Text(
                dataprovinsi.key,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "Jumlah Kasus",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    dataprovinsi.jumlahKasus.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: orangeDashboard),
                  ),
                  Divider(
                    thickness: 0.5,
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DataStatus(
                          judul: "Meninggal",
                          jumlah: dataprovinsi.jumlahMeninggal),
                      DataStatus(
                          judul: "Sembuh", jumlah: dataprovinsi.jumlahSembuh),
                      DataStatus(
                          judul: "Dirawat", jumlah: dataprovinsi.jumlahDirawat),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DataStatus extends StatelessWidget {
  const DataStatus({
    Key key,
    this.judul,
    this.jumlah,
  }) : super(key: key);

  final String judul;
  final int jumlah;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            judul,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6),
          Text(
            jumlah.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: judul == "Meninggal"
                    ? redDashboard
                    : judul == "Sembuh"
                        ? greenDashboard
                        : blueDashboard),
          ),
        ],
      ),
    );
  }
}
