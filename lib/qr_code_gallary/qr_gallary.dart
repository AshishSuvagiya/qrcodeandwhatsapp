import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:image_picker/image_picker.dart';

String? data;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future imgScan() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    if (image == null) return;

    final rest = await FlutterQrReader.imgScan(image.path);

    setState(
      () {
        data = rest;
      },
    );

    if (kDebugMode) {
      print(
        "DATA=====>$data",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "QR CODE",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                imgScan();
              },
              child: const Center(
                child: Text(
                  "GET",
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Text(
                data.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
