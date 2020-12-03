import 'package:covid19app/Model/Indonesia_Model.dart';
import 'package:covid19app/contstant/ColorTemplate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Dashboard_component.dart';

class DashboardStructure extends StatelessWidget {
  const DashboardStructure({
    Key key,
    @required this.dataIndonesia,
  }) : super(key: key);
  final Indonesia dataIndonesia;
  @override
  Widget build(BuildContext context) {
    var safePadding = MediaQuery.of(context).padding.top;
    var appbarheight = 66.0;
    return Padding(
      padding:
          EdgeInsets.only(top: safePadding + appbarheight, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "STATISTIK COVID19\nINDONESIA",
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Update Terakhir : ",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: DateFormat.yMd()
                            .add_jm()
                            .format(dataIndonesia.update.penambahan.created))
                  ]),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DataKasusRow1(
                text: "Kasus Positif",
                jumlah: dataIndonesia.update.total.jumlahPositif.toString(),
                warna: orangeDashboard,
                penambahan: dataIndonesia.update.penambahan.jumlahPositif,
              ),
              DataKasusRow1(
                text: "Kasus Meninggal",
                jumlah: dataIndonesia.update.total.jumlahMeninggal.toString(),
                warna: redDashboard,
                penambahan: dataIndonesia.update.penambahan.jumlahMeninggal,
              ),
            ],
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DataKasusRow2(
                text: "Sembuh",
                jumlah: dataIndonesia.update.total.jumlahSembuh.toString(),
                warna: greenDashboard,
                penambahan: dataIndonesia.update.penambahan.jumlahSembuh,
              ),
              DataKasusRow2(
                text: "Dirawat",
                jumlah: dataIndonesia.update.total.jumlahDirawat.toString(),
                warna: blueDashboard,
                penambahan: dataIndonesia.update.penambahan.jumlahDirawat,
              ),
              DataKasusRow2(
                text: "Jumlah ODP",
                jumlah: dataIndonesia.data.jumlahOdp.toString(),
                warna: purpleDashboard,
              ),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Sumber data : ",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(text: "covid19.go.id")
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
