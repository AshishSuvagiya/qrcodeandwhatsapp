import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Qr_code_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.black,
        hoverColor: Colors.black,
        primarySwatch: Colors.green,
      ),
      themeMode: ThemeMode.system,
      home: const QRViewExample(),
    );
  }
}
