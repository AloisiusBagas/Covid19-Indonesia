import 'package:covid19app/Provider/ProvinsiIndonesiaProvider.dart';
import 'package:covid19app/contstant/Debouncer.dart';
import 'package:flutter/material.dart';

class SearchProvinsi extends StatefulWidget {
  const SearchProvinsi({
    Key key,
    @required this.provinsiIndonesiaProvider,
  }) : super(key: key);
  final ProvinsiIndonesiaProvider provinsiIndonesiaProvider;

  @override
  _SearchProvinsiState createState() => _SearchProvinsiState();
}

TextEditingController searchcontroller;

class _SearchProvinsiState extends State<SearchProvinsi> {
  @override
  void initState() {
    searchcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchcontroller.dispose();
    widget.provinsiIndonesiaProvider.setsearchprovinsi = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.5),
      child: TextField(
        controller: searchcontroller,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: "Cari Provinsi..",
          hintStyle: TextStyle(color: Colors.grey[350], fontSize: 14),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFFCBCBCB), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
        ),
        onChanged: (value) {
          _debouncer.run(
            () {
              widget.provinsiIndonesiaProvider.setsearchprovinsi = value;
            },
          );
        },
      ),
    );
  }
}
