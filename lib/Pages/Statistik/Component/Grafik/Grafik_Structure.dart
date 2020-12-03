import 'package:covid19app/Model/Indonesia_Model.dart';
import 'package:flutter/material.dart';

import 'Grafik_Template.dart';

class GrafikStructure extends StatelessWidget {
  const GrafikStructure({
    Key key,
    @required this.dataIndonesia,
  }) : super(key: key);

  final Indonesia dataIndonesia;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            GrafikTemplate(
              dataHarian: dataIndonesia.update.harian,
              id: "Positif",
            ),
            GrafikTemplate(
              dataHarian: dataIndonesia.update.harian,
              id: "Sembuh",
            ),
            GrafikTemplate(
              dataHarian: dataIndonesia.update.harian,
              id: "Meninggal",
            ),
          ],
        ),
      ),
    );
  }
}
