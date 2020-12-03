import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19app/Model/Grafik_Model.dart';
import 'package:covid19app/contstant/ColorTemplate.dart';
import 'package:flutter/material.dart';

import 'package:covid19app/Model/ProvinsiIndonesia_Model.dart';

class GrafikUmur extends StatefulWidget {
  final List<KelompokUmur> dataumur;
  const GrafikUmur({
    Key key,
    this.dataumur,
  }) : super(key: key);

  @override
  _GrafikUmurState createState() => _GrafikUmurState();
}

List<KelompokUmur> listdata;
List<charts.Series<Modelgrafikdata, String>> piedata;

void setgrafik(List<KelompokUmur> dataumur) {
  var data = [
    new Modelgrafikdata(
        text: "0 - 5", value: dataumur[0].docCount, color: barcahartcolor1),
    new Modelgrafikdata(
        text: "6 - 18", value: dataumur[1].docCount, color: barcahartcolor2),
    new Modelgrafikdata(
        text: "19 - 30", value: dataumur[2].docCount, color: barcahartcolor3),
    new Modelgrafikdata(
        text: "31 - 45", value: dataumur[3].docCount, color: barcahartcolor4),
    new Modelgrafikdata(
        text: "46 - 59", value: dataumur[4].docCount, color: barcahartcolor5),
    new Modelgrafikdata(
        text: "> 60", value: dataumur[5].docCount, color: barcahartcolor6),
  ];

  piedata.add(
    charts.Series(
      domainFn: (Modelgrafikdata umur, _) => umur.text,
      measureFn: (Modelgrafikdata umur, _) => umur.value,
      colorFn: (Modelgrafikdata umur, _) =>
          charts.ColorUtil.fromDartColor(umur.color),
      id: 'Gender',
      data: data,
      labelAccessorFn: (Modelgrafikdata umur, _) => '${umur.value}',
    ),
  );
}

class _GrafikUmurState extends State<GrafikUmur> {
  @override
  void initState() {
    listdata = List<KelompokUmur>();
    piedata = List<charts.Series<Modelgrafikdata, String>>();
    setgrafik(widget.dataumur);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Kelompok Umur\nPositif Covid-19",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 450,
                height: 255,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: charts.BarChart(
                  piedata,
                  animate: true,
                  animationDuration: Duration(seconds: 2),
                  barRendererDecorator: new charts.BarLabelDecorator<String>(),
                  domainAxis: new charts.OrdinalAxisSpec(),
                ),
              ),
            ),
          ],
        ),
      ),
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
