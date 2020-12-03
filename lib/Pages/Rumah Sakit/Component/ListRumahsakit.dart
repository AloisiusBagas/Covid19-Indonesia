import 'package:covid19app/Model/RumahSakit_Model.dart';
import 'package:covid19app/Pages/Rumah%20Sakit/Component/Rumahsakit_card.dart';
import 'package:covid19app/Provider/RumahsakitProvider.dart';
import 'package:flutter/material.dart';

class ListRumahsakit extends StatelessWidget {
  const ListRumahsakit({
    Key key,
    @required this.rumahsakitProvider,
  }) : super(key: key);
  final RumahsakitProvider rumahsakitProvider;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rumahsakitProvider.getdataRumahSakit(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false ||
              snapshot.hasError == true ||
              rumahsakitProvider.isloading == true) {
            return Expanded(child: Center(child: CircularProgressIndicator()));
          } else {
            List<RumahSakit> listprovinsi = snapshot.data;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                    itemCount: listprovinsi.length,
                    itemBuilder: (context, index) {
                      return RumahsakitCard(
                          datarumahsakit: listprovinsi[index]);
                    }),
              ),
            );
          }
        });
  }
}
