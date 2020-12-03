import 'package:covid19app/Pages/MainPage.dart';
import 'package:covid19app/Provider/ProvinsiIndonesiaProvider.dart';
import 'package:covid19app/Provider/RumahsakitProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'Provider/IndonesiaProvider.dart';
import 'contstant/DisableLandscape.dart';

main(List<String> args) {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    disableLandscape();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IndonesiaProvider>(
          create: (context) => IndonesiaProvider(),
        ),
        ChangeNotifierProvider<ProvinsiIndonesiaProvider>(
          create: (context) => ProvinsiIndonesiaProvider(),
        ),
        ChangeNotifierProvider<RumahsakitProvider>(
          create: (context) => RumahsakitProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
