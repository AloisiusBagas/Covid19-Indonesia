import 'package:covid19app/Model/ProvinsiIndonesia_Model.dart';
import 'package:covid19app/Provider/ProvinsiIndonesiaProvider.dart';
import 'package:flutter/material.dart';
import 'Provinsi_card.dart';

class ListProvinsi extends StatelessWidget {
  const ListProvinsi({
    Key key,
    @required this.provinsiIndonesiaProvider,
  }) : super(key: key);

  final ProvinsiIndonesiaProvider provinsiIndonesiaProvider;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: provinsiIndonesiaProvider.getdataprovinsiIndonesia(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false ||
              snapshot.hasError == true ||
              provinsiIndonesiaProvider.isloading == true) {
            return Expanded(child: Center(child: CircularProgressIndicator()));
          } else {
            List<ListDatum> listprovinsi = snapshot.data;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                    itemCount: listprovinsi.length,
                    itemBuilder: (context, index) {
                      return ProvinsiCard(
                        dataprovinsi: listprovinsi[index],
                        provinsiIndonesiaProvider: provinsiIndonesiaProvider,
                      );
                    }),
              ),
            );
          }
        });
  }
}
