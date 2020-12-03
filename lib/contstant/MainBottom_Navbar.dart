import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ColorTemplate.dart';

class MainBottomNavBar extends StatefulWidget {
  final PageController pageController;
  const MainBottomNavBar({
    Key key,
    this.pageController,
  }) : super(key: key);

  @override
  _MainBottomNavBarState createState() => _MainBottomNavBarState();
}

int currindex = 0;

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: Offset(0, -3))
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconBTMAppbar(
              "assets/icons/appbar/home.svg",
              "Home",
              0,
            ),
            iconBTMAppbar(
              "assets/icons/appbar/pin.svg",
              "Provinsi",
              1,
            ),
            iconBTMAppbar(
              "assets/icons/appbar/hospital-buildings.svg",
              "Rs Rujukan",
              2,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector iconBTMAppbar(String svgpath, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currindex = index;
          widget.pageController.jumpToPage(index);
        });
      },
      child: Tooltip(
        //margin: EdgeInsets.only(bottom: 2),
        padding: EdgeInsets.all(8),
        message: text,
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width / 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  svgpath,
                  height: 17,
                  color: currindex == index ? darkpurple : Color(0xFF97A2AA),
                ),
                SizedBox(height: 3),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: currindex == index
                          ? FontWeight.w700
                          : FontWeight.w600,
                      color:
                          currindex == index ? darkpurple : Color(0xFF97A2AA)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
