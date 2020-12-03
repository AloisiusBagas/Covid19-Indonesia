import 'package:covid19app/Model/ProvinsiIndonesia_Model.dart';
import 'package:covid19app/Pages/Kasus%20Provinsi/Detail%20Provinsi/Detailprovinsi_page.dart';
import 'package:covid19app/Provider/ProvinsiIndonesiaProvider.dart';
import 'package:flutter/material.dart';

class ProvinsiCard extends StatelessWidget {
  const ProvinsiCard({
    Key key,
    @required this.dataprovinsi,
    this.provinsiIndonesiaProvider,
  }) : super(key: key);

  final ListDatum dataprovinsi;
  final ProvinsiIndonesiaProvider provinsiIndonesiaProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Material(
          color: Colors.grey[200],
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetailprovinsiPage(dataprovinsi: dataprovinsi)));
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                        child: Text(
                      dataprovinsi.key,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8.0),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: provinsiIndonesiaProvider.sortby ==
                                        "Meninggal"
                                    ? "Jumlah Meninggal : "
                                    : provinsiIndonesiaProvider.sortby ==
                                            "Sembuh"
                                        ? "Jumlah Sembuh : "
                                        : provinsiIndonesiaProvider.sortby ==
                                                "Dirawat"
                                            ? "Jumlah Dirawat : "
                                            : "Jumlah Positif : ",
                                style: TextStyle(fontSize: 12)),
                            TextSpan(
                                text: provinsiIndonesiaProvider.sortby ==
                                        "Meninggal"
                                    ? dataprovinsi.jumlahMeninggal.toString()
                                    : provinsiIndonesiaProvider.sortby ==
                                            "Sembuh"
                                        ? dataprovinsi.jumlahSembuh.toString()
                                        : provinsiIndonesiaProvider.sortby ==
                                                "Dirawat"
                                            ? dataprovinsi.jumlahDirawat
                                                .toString()
                                            : dataprovinsi.jumlahKasus
                                                .toString(),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 13,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
