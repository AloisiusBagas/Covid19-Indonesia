import 'package:covid19app/Provider/ProvinsiIndonesiaProvider.dart';
import 'package:covid19app/contstant/Appbar_template.dart';
import 'package:covid19app/contstant/ColorTemplate.dart';
import 'package:covid19app/contstant/KeyboardHider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Component/ListProvinsi.dart';
import 'Component/Searchbar_Provinsi.dart';

class KasusProvinsiPage extends StatefulWidget {
  const KasusProvinsiPage();
  @override
  _KasusProvinsiPageState createState() => _KasusProvinsiPageState();
}

class _KasusProvinsiPageState extends State<KasusProvinsiPage> {
  @override
  Widget build(BuildContext context) {
    final _dataprovIndonesia = Provider.of<ProvinsiIndonesiaProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const DefaultAppbar(
          isAction: true,
        ),
        body: KeyboardHider(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: darkpurple,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/images/PulauIndonesia.png"),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: MediaQuery.of(context).size.height * 0.27,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DATA COVID19 PER PROVINSI",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Cek Provinsi mu sekarang...",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    SearchProvinsi(
                        provinsiIndonesiaProvider: _dataprovIndonesia),
                  ],
                ),
              ),
              ListProvinsi(
                provinsiIndonesiaProvider: _dataprovIndonesia,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
