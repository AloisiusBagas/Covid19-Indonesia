import 'package:covid19app/Pages/Kasus%20Provinsi/Provinsi/Component/AlertSort.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ColorTemplate.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({
    Key key,
    this.iconData,
    this.isAction = false,
    this.title,
  }) : super(key: key);

  final IconData iconData;
  final bool isAction;
  final String title;
  @override
  Widget build(BuildContext context) {
    AlertSort alertSort = AlertSort();
    return AppBar(
      backgroundColor: darkpurple,
      title: title != null
          ? Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: Colors.white),
            )
          : SvgPicture.asset("assets/icons/logoAppbar.svg", height: 14),
      elevation: 0,
      actions: [
        isAction
            ? IconButton(
                tooltip: "SortBy",
                padding: EdgeInsets.only(right: 16),
                icon: Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
                onPressed: () {
                  alertSort.sortAlert(context);
                })
            : Container()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
