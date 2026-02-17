import 'package:covid19app/Pages/Statistik/Statistik_page.dart';
import 'package:covid19app/contstant/ColorTemplate.dart';
import 'package:covid19app/contstant/KeyboardHider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Kasus Provinsi/Provinsi/KasusProvinsi_page.dart';
import 'Rumah Sakit/Rumahsakit_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomSelectedIndex = 0;
  late PageController _pagecontroller;
  @override
  void initState() {
    _pagecontroller = new PageController(initialPage: 0);
    super.initState();
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      _pagecontroller.animateToPage(index,
          duration: Duration(milliseconds: 900), curve: Curves.ease);
    });
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
      BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.locationDot), label: 'Provinsi'),
      BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
          label: 'Rs rujukan')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: KeyboardHider(
          child: PageView(
            controller: _pagecontroller,
            children: [
              const StatistikPage(),
              const KasusProvinsiPage(),
              const RumahsakitPage(),
            ],
            onPageChanged: (index) {
              pageChanged(index);
            },
            //physics: NeverScrollableScrollPhysics(),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 48,
          child: BottomNavigationBar(
              selectedItemColor: darkpurple,
              unselectedItemColor: Color(0xFF97A2AA),
              iconSize: 18,
              elevation: 12,
              unselectedLabelStyle:
                  TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              selectedLabelStyle:
                  TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
              currentIndex: bottomSelectedIndex,
              onTap: (index) {
                bottomTapped(index);
              },
              items: buildBottomNavBarItems()),
        ));
  }
}
