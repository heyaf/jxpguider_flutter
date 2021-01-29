// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:jxpguider_flutter/others/HYFTestModelProvider.dart';
import 'package:jxpguider_flutter/others/homeBannerViewModel.dart';
import './Pages/tabbar_pages.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HYFModelProvider(100)),
      ChangeNotifierProvider(create: (context) => HYFHomeBannerViewModel())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        buttonTheme: ButtonThemeData(minWidth: 0, height: 0.0),
      ),
      home: bottomTabbar(),
    );
  }
}
