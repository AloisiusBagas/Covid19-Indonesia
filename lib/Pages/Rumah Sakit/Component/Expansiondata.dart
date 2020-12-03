import 'package:covid19app/Model/RumahSakit_Model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Expansiondata extends StatelessWidget {
  const Expansiondata({
    Key key,
    this.datarumahsakit,
  }) : super(key: key);
  final RumahSakit datarumahsakit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 15),
      color: Colors.grey[50],
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          datarumahsakit.region != null
              ? detaildata(datarumahsakit.region, FontAwesomeIcons.mapMarkedAlt)
              : Container(),
          datarumahsakit.address != null
              ? detaildata(
                  datarumahsakit.address, FontAwesomeIcons.mapMarkerAlt)
              : Container(),
          datarumahsakit.phone != null
              ? detaildata(datarumahsakit.phone, FontAwesomeIcons.phone)
              : Container(),
        ],
      ),
    );
  }

  Padding detaildata(String text, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(
              width: 20,
              height: 10,
              child: FaIcon(iconData, size: 16, color: Colors.grey[700])),
          SizedBox(width: 12),
          Container(
            child: Flexible(
              child: Text(
                text,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Row phonenumber(String text) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Container(
  //         child: Row(
  //           children: [
  //             SizedBox(
  //                 width: 20,
  //                 height: 10,
  //                 child: FaIcon(FontAwesomeIcons.phone,
  //                     size: 16, color: Colors.grey[700])),
  //             SizedBox(width: 12),
  //             Container(
  //               child: Text(
  //                 text,
  //                 style: TextStyle(fontSize: 12),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       RaisedButton(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  //         color: Colors.greenAccent,
  //         child: Row(
  //           children: [
  //             FaIcon(
  //               FontAwesomeIcons.phone,
  //               size: 14,
  //               color: Colors.white,
  //             ),
  //             SizedBox(width: 8),
  //             Text(
  //               "Telepon",
  //               style: TextStyle(color: Colors.white, fontSize: 12),
  //             ),
  //           ],
  //         ),
  //         onPressed: () {},
  //       )
  //     ],
  //   );
  // }
}
