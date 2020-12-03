import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19app/Model/Grafik_Model.dart';
import 'package:covid19app/contstant/ColorTemplate.dart';
import 'package:flutter/material.dart';

import 'package:covid19app/Model/ProvinsiIndonesia_Model.dart';

class GrafikGender extends StatefulWidget {
  final List<JenisKelamin> datagender;
  const GrafikGender({
    Key key,
    this.datagender,
  }) : super(key: key);

  @override
  _GrafikGenderState createState() => _GrafikGenderState();
}

List<JenisKelamin> listdata;
List<charts.Series<Modelgrafikdata, String>> piedata;

void setgrafik(List<JenisKelamin> datagender) {
  var data = [
    new Modelgrafikdata(
        text: "Laki Laki",
        value: datagender[0].docCount,
        color: bluegraphcolor),
    new Modelgrafikdata(
        text: "Perempuan",
        value: datagender[1].docCount,
        color: pinkgraphcolor),
  ];

  piedata.add(
    charts.Series(
      domainFn: (Modelgrafikdata gender, _) => gender.text,
      measureFn: (Modelgrafikdata gender, _) => gender.value,
      colorFn: (Modelgrafikdata gender, _) =>
          charts.ColorUtil.fromDartColor(gender.color),
      id: 'Gender',
      data: data,
      labelAccessorFn: (Modelgrafikdata gender, _) => '${gender.value}',
    ),
  );
}

class _GrafikGenderState extends State<GrafikGender> {
  @override
  void initState() {
    setState(() {});
    listdata = List<JenisKelamin>();
    piedata = List<charts.Series<Modelgrafikdata, String>>();
    setgrafik(widget.datagender);
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
              child: Text("Jenis Kelamin\nPositif Covid-19",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
            ),
            Container(
              width: 260,
              height: 260,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: charts.PieChart(piedata,
                  animate: true,
                  animationDuration: Duration(seconds: 2),
                  behaviors: [
                    new charts.DatumLegend(
                      outsideJustification: charts.OutsideJustification.end,
                      position: charts.BehaviorPosition.bottom,
                      horizontalFirst: false,
                      desiredMaxRows: 1,
                      //cellPadding: new EdgeInsets.only(right: 4.0, bottom: 100.0),
                      entryTextStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.black, fontSize: 12),
                    )
                  ],
                  defaultRenderer: new charts.ArcRendererConfig(
                      arcRendererDecorators: [
                        new charts.ArcLabelDecorator(
                            labelPosition: charts.ArcLabelPosition.inside)
                      ])),
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
