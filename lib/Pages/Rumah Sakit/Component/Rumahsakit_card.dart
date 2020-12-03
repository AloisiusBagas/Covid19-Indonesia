import 'package:covid19app/Model/RumahSakit_Model.dart';
import 'package:flutter/material.dart';

import 'Expansiondata.dart';

class RumahsakitCard extends StatefulWidget {
  const RumahsakitCard({
    Key key,
    @required this.datarumahsakit,
  }) : super(key: key);

  final RumahSakit datarumahsakit;

  @override
  _RumahsakitCardState createState() => _RumahsakitCardState();
}

class _RumahsakitCardState extends State<RumahsakitCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 10, 12, 0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 12),
        backgroundColor: Colors.grey[300],
        title: Text(
          widget.datarumahsakit.name,
          style: TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          widget.datarumahsakit.province,
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        expandedAlignment: Alignment.topLeft,
        children: [
          Expansiondata(datarumahsakit: widget.datarumahsakit),
        ],
      ),
    );
  }
}
