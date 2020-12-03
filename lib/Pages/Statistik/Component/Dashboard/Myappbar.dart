import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SvgPicture.asset("assets/icons/logoAppbar.svg", height: 14));
  }
}
