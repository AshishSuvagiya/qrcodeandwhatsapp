import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Shareed extends StatefulWidget {
  const Shareed({Key? key}) : super(key: key);

  @override
  _ShareedState createState() => _ShareedState();
}

class _ShareedState extends State<Shareed> {
  final searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            onChanged: (value) {},
            controller: searchcontroller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              hintText: "type message",
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var whatsappUrl = "https://wa.me/?text=${searchcontroller.text}";
              await canLaunch(whatsappUrl) != null
                  ? launch(whatsappUrl)
                  : print(
                      "open WhatsApp app link or do a snackbar with notification that there is no WhatsApp installed");
            },
            child: const Text("Share"),
          ),
        ],
      ),
    );
  }
}
