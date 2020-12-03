import 'package:covid19app/Pages/Rumah%20Sakit/Component/ListRumahsakit.dart';
import 'package:covid19app/Pages/Rumah%20Sakit/Component/Searchbar_Rumahsakit.dart';
import 'package:covid19app/Provider/RumahsakitProvider.dart';
import 'package:covid19app/contstant/Appbar_template.dart';
import 'package:covid19app/contstant/ColorTemplate.dart';
import 'package:covid19app/contstant/KeyboardHider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RumahsakitPage extends StatefulWidget {
  const RumahsakitPage();
  @override
  _RumahsakitPageState createState() => _RumahsakitPageState();
}

class _RumahsakitPageState extends State<RumahsakitPage> {
  @override
  Widget build(BuildContext context) {
    final _rumahsakitprovider = Provider.of<RumahsakitProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const DefaultAppbar(),
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
                      "DAFTAR RUMAH SAKIT RUJUKAN",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Daftar rumah sakit rujukan penanganan COVID-19",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    SearchRumahsakit(rumahsakitProivder: _rumahsakitprovider),
                  ],
                ),
              ),
              ListRumahsakit(rumahsakitProvider: _rumahsakitprovider)
            ],
          ),
        ),
      ),
    );
  }
}
