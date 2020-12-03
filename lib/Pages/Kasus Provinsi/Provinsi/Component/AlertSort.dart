import 'package:covid19app/Provider/ProvinsiIndonesiaProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListSort {
  final String label;
  final Function onpress;

  ListSort(this.label, this.onpress);
}

class AlertSort {
  bool isdesc = true;
  void sortAlert(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
        title: Text("SortBy"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SortDirection(),
            Divider(),
            SortBy(),
          ],
        ));
    showDialog(context: context, child: alertDialog);
  }
}

class SortDirection extends StatefulWidget {
  final String label;

  const SortDirection({Key key, this.label}) : super(key: key);
  @override
  _SortDirectionState createState() => _SortDirectionState();
}

class _SortDirectionState extends State<SortDirection> {
  List<String> listdirection = ['ASC', 'DSC'];
  static int defaultchoice = 1;
  @override
  Widget build(BuildContext context) {
    final _dataIndonesia = Provider.of<ProvinsiIndonesiaProvider>(context);

    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(
        listdirection.length,
        (index) {
          return ChoiceChip(
            label: Text(listdirection[index]),
            labelStyle: TextStyle(color: Colors.black),
            selected: defaultchoice == index,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.white,
            onSelected: (selected) {
              listdirection[index] == "ASC"
                  ? _dataIndonesia.setisDecending = false
                  : _dataIndonesia.setisDecending = true;
              setState(() {
                defaultchoice = selected ? index : null;
              });
            },
            selectedColor: Colors.blueAccent,
          );
        },
      ),
    );
  }
}

class SortBy extends StatefulWidget {
  final String label;

  const SortBy({Key key, this.label}) : super(key: key);
  @override
  _SortByState createState() => _SortByState();
}

class _SortByState extends State<SortBy> {
  List<String> listsort = [
    'Positif',
    'Sembuh',
    'Dirawat',
    'Meninggal',
    'Alfabet'
  ];
  static int defaultchoice = 0;
  bool isselected;
  @override
  Widget build(BuildContext context) {
    final _dataIndonesia = Provider.of<ProvinsiIndonesiaProvider>(context);

    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(
        listsort.length,
        (index) {
          return ChoiceChip(
            label: Text(listsort[index]),
            labelStyle: TextStyle(color: Colors.black),
            selected: (defaultchoice == index),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.white,
            onSelected: (selected) {
              _dataIndonesia.setsortBy = listsort[index];
              setState(() {
                defaultchoice = selected ? index : null;
              });
            },
            selectedColor: Colors.blueAccent,
          );
        },
      ),
    );
  }
}
