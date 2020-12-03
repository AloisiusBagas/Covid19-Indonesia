import 'package:flutter/material.dart';

class DataKasusRow1 extends StatelessWidget {
  const DataKasusRow1({
    Key key,
    this.text,
    this.jumlah,
    this.warna,
    this.isloading = false,
    this.penambahan = 0,
  }) : super(key: key);
  final String text;
  final String jumlah;
  final int penambahan;
  final Color warna;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 24,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
      decoration:
          BoxDecoration(color: warna, borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 13.5),
          ),
          Center(
              child: Padding(
            padding: penambahan != 0
                ? const EdgeInsets.symmetric(vertical: 8)
                : const EdgeInsets.symmetric(vertical: 20),
            child: isloading
                ? Container(
                    height: 18.0,
                    width: 18.0,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Column(
                    children: [
                      Text(
                        jumlah,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 23),
                      ),
                      if (penambahan != 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (penambahan > 0)
                              Text(
                                "+",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                              ),
                            Text(penambahan.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                ))
                          ],
                        )
                    ],
                  ),
          )),
        ],
      ),
    );
  }
}

class DataKasusRow2 extends StatelessWidget {
  const DataKasusRow2({
    Key key,
    this.text,
    this.jumlah,
    this.warna,
    this.isloading = false,
    this.penambahan = 0,
  }) : super(key: key);
  final String text;
  final String jumlah;
  final int penambahan;
  final Color warna;
  final isloading;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 3) - 20,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
      decoration:
          BoxDecoration(color: warna, borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13),
          ),
          Center(
            child: Padding(
              padding: penambahan != 0
                  ? const EdgeInsets.symmetric(vertical: 8)
                  : const EdgeInsets.symmetric(vertical: 17),
              child: Column(
                children: [
                  isloading
                      ? Container(
                          height: 18.0,
                          width: 18.0,
                          child: const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Column(
                          children: [
                            Text(
                              jumlah,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                            if (penambahan != 0)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (penambahan > 0)
                                    Text(
                                      "+",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                  Text(penambahan.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontStyle: FontStyle.italic))
                                ],
                              )
                          ],
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
