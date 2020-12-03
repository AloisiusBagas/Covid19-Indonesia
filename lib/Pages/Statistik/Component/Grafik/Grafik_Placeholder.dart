import 'package:flutter/material.dart';

class GrafikPlaceholder extends StatelessWidget {
  const GrafikPlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            PlaceholderView(
              judul: 'Grafik\nPasien Positif',
            ),
            PlaceholderView(
              judul: 'Grafik\nPasien Sembuh',
            ),
            PlaceholderView(
              judul: 'Grafik\nPasien Meninggal',
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderView extends StatelessWidget {
  const PlaceholderView({
    Key key,
    this.judul,
  }) : super(key: key);
  final String judul;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            judul,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 20.0,
            width: 20.0,
            child: const CircularProgressIndicator(),
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
