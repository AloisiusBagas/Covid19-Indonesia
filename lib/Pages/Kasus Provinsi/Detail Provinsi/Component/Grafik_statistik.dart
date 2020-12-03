import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19app/Model/Grafik_Model.dart';
import 'package:flutter/material.dart';

import 'package:covid19app/Model/ProvinsiIndonesia_Model.dart';

class GrafikStatistik extends StatefulWidget {
  final int jumlahKasus;
  final int jumlahSembuh;
  final int jumlahMeninggal;
  final int jumlahDirawat;

  const GrafikStatistik({
    Key key,
    this.jumlahKasus,
    this.jumlahSembuh,
    this.jumlahMeninggal,
    this.jumlahDirawat,
  }) : super(key: key);

  @override
  _GrafikStatistikState createState() => _GrafikStatistikState();
}

List<ListDatum> listdata;
List<charts.Series<Modelgrafikdata, String>> piedata;

void setgrafik(int kasus, int sembuh, int meninggal, int dirawat) {
  var data = [
    new Modelgrafikdata(text: "Positif", value: kasus, color: Colors.amber),
    new Modelgrafikdata(text: "Sembuh", value: sembuh, color: Colors.green),
    new Modelgrafikdata(
        text: "Meninggal", value: meninggal, color: Colors.blue),
    new Modelgrafikdata(text: "Dirawat", value: dirawat, color: Colors.red),
  ];

  piedata.add(
    charts.Series(
      domainFn: (Modelgrafikdata data, _) => data.text,
      measureFn: (Modelgrafikdata data, _) => data.value,
      colorFn: (Modelgrafikdata data, _) =>
          charts.ColorUtil.fromDartColor(data.color),
      id: 'Gender',
      data: data,
      labelAccessorFn: (Modelgrafikdata data, _) => '${data.value}',
    ),
  );
}

class _GrafikStatistikState extends State<GrafikStatistik> {
  @override
  void initState() {
    listdata = List<ListDatum>();
    piedata = List<charts.Series<Modelgrafikdata, String>>();
    setgrafik(widget.jumlahKasus, widget.jumlahSembuh, widget.jumlahMeninggal,
        widget.jumlahDirawat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Jenis Kelamin\nPositif Covid-19",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
        Container(
          width: 255,
          height: 270,
          child: charts.PieChart(piedata,
              animate: true,
              animationDuration: Duration(seconds: 2),
              behaviors: [
                new charts.DatumLegend(
                  outsideJustification:
                      charts.OutsideJustification.middleDrawArea,
                  position: charts.BehaviorPosition.bottom,
                  horizontalFirst: false,
                  desiredMaxRows: 2,
                  //cellPadding: new EdgeInsets.only(right: 4.0, bottom: 100.0),
                  entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.black, fontSize: 12),
                )
              ],
              defaultRenderer: new charts.ArcRendererConfig(
                  arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.auto)
                  ])),
        ),
      ],
    );
  }
}

class Modelgender {
  final String text;
  final int value;
  final Color color;
  Modelgender({
    this.text,
    this.value,
    this.color,
  });
}
