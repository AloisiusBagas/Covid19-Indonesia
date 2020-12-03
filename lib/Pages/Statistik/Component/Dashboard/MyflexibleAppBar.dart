import 'package:covid19app/Pages/Statistik/Component/Dashboard/Dashboad_Placeholder.dart';
import 'package:covid19app/Provider/IndonesiaProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Dashboard_Structure.dart';

class MyFlexiableAppBar extends StatelessWidget {
  MyFlexiableAppBar();
  @override
  Widget build(BuildContext context) {
    final _dataindonesia = Provider.of<IndonesiaProvider>(context);

    return FutureBuilder(
      future: _dataindonesia.getdataIndonesia(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false || snapshot.hasError == true) {
          return DashboardPlaceholder();
        }
        return DashboardStructure(
          dataIndonesia: snapshot.data,
        );
      },
    );
  }
}
