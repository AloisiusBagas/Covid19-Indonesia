import 'package:flutter/material.dart';

import 'Dashboard_component.dart';

class DashboardPlaceholder extends StatelessWidget {
  const DashboardPlaceholder({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var safePadding = MediaQuery.of(context).padding.top;
    var appbarheight = 66.0;
    return Padding(
      padding:
          EdgeInsets.only(top: safePadding + appbarheight, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Update Terakhir : - ",
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DataKasusRow1(
                text: "Kasus Positif",
                warna: Color(0xFFFFB259),
                isloading: true,
              ),
              DataKasusRow1(
                text: "Kasus Meninggal",
                warna: Color(0xFFFF5959),
                isloading: true,
              ),
            ],
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DataKasusRow2(
                text: "Sembuh",
                warna: Color(0xFF4CD97B),
                isloading: true,
              ),
              DataKasusRow2(
                text: "Dirawat",
                warna: Color(0xFF4CB5FF),
                isloading: true,
              ),
              DataKasusRow2(
                text: "Jumlah ODP",
                warna: Color(0xFF9059FF),
                isloading: true,
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
