import 'dart:math';
import 'package:covid19app/Model/Indonesia_Model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
// ignore: implementation_imports
import 'package:charts_flutter/src/text_element.dart' as chartsTextElement;
// ignore: implementation_imports
import 'package:charts_flutter/src/text_style.dart' as chartsTextStyle;

int currentval;

class GrafikTemplate extends StatefulWidget {
  final List<Harian> dataHarian;
  final String id;
  const GrafikTemplate({Key key, this.dataHarian, this.id}) : super(key: key);

  @override
  _GrafikTemplateState createState() => _GrafikTemplateState();
}

List<Harian> listData;
List<charts.Series<Harian, DateTime>> dataPositif;

List<Harian> generatedata(List<Harian> data) {
  var sixmonthago = DateTime.now().month - 6;
  return data.where((data) => data.keyAsString.month >= sixmonthago).toList();
}

void setgrafik(String id) {
  dataPositif.add(
    charts.Series<Harian, DateTime>(
      id: 'Data $id',
      colorFn: (_, __) => (id == "Positif")
          ? charts.MaterialPalette.yellow.shadeDefault
          : (id == "Sembuh")
              ? charts.MaterialPalette.green.shadeDefault
              : charts.MaterialPalette.red.shadeDefault,
      domainFn: (Harian data, _) => data.keyAsString,
      measureFn: (Harian data, _) => (id == "Positif")
          ? data.jumlahPositif.value
          : (id == "Sembuh")
              ? data.jumlahSembuh.value
              : data.jumlahMeninggal.value,
      data: listData,
    ),
  );
}

class _GrafikTemplateState extends State<GrafikTemplate> {
  @override
  void initState() {
    super.initState();
    listData = List<Harian>();
    dataPositif = List<charts.Series<Harian, DateTime>>();
    listData = generatedata(widget.dataHarian);
    setgrafik(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Grafik\nPasien ${widget.id}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: 1000,
                height: 250,
                child: charts.TimeSeriesChart(
                  dataPositif,
                  animate: true,
                  customSeriesRenderers: [
                    new charts.SymbolAnnotationRendererConfig(
                        // ID used to link series to this renderer.
                        customRendererId: 'customSymbolAnnotation')
                  ],
                  behaviors: [
                    charts.LinePointHighlighter(
                        symbolRenderer: CustomCircleSymbolRenderer())
                  ],
                  selectionModels: [
                    charts.SelectionModelConfig(
                        changedListener: (charts.SelectionModel model) {
                      if (model.hasDatumSelection)
                        currentval = model.selectedSeries[0]
                            .measureFn(model.selectedDatum[0].index);
                      print(currentval);
                    })
                  ],
                  animationDuration: Duration(seconds: 3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCircleSymbolRenderer extends charts.CircleSymbolRenderer {
  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      charts.Color fillColor,
      charts.FillPatternType fillPattern,
      charts.Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
        Rectangle(bounds.left - 10, bounds.top - 30, bounds.width + 40,
            bounds.height + 10),
        fill: charts.Color.white);
    final textStyle = chartsTextStyle.TextStyle();
    textStyle.color = charts.Color.black;
    textStyle.fontSize = 12;
    final chartsTextElement.TextElement textElement =
        chartsTextElement.TextElement("$currentval", style: textStyle);
    canvas.drawText(
        textElement, (bounds.left).round(), (bounds.top - 28).round());
  }
}
