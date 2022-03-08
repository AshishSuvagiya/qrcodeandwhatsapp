import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeay/screen.dart';
import 'package:yeay/share.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.green,
        hoverColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      themeMode: ThemeMode.system,
      home: Shareed(),
    );
  }
}
