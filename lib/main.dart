import 'package:flutter/cupertino.dart';
import 'package:stylish/pages/screen.dart';
import 'dart:async';

import 'package:stylish/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isSplash = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      setState(() {
        isSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: isSplash ? Screen() : Splash()
    );
  }
} 


