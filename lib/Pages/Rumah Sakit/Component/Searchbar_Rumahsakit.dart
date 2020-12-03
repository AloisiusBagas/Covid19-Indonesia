import 'package:covid19app/Provider/RumahsakitProvider.dart';
import 'package:covid19app/contstant/Debouncer.dart';
import 'package:flutter/material.dart';

class SearchRumahsakit extends StatefulWidget {
  const SearchRumahsakit({
    Key key,
    @required this.rumahsakitProivder,
  }) : super(key: key);
  final RumahsakitProvider rumahsakitProivder;

  @override
  _SearchRumahsakitState createState() => _SearchRumahsakitState();
}

TextEditingController searchcontroller;

class _SearchRumahsakitState extends State<SearchRumahsakit> {
  @override
  void initState() {
    searchcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchcontroller.dispose();
    widget.rumahsakitProivder.setsearchrumahsakit = "";
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
            hintText: "Cari Lokasi..",
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
            _debouncer.run(() {
              widget.rumahsakitProivder.setsearchrumahsakit = value;
            });
          }),
    );
  }
}
