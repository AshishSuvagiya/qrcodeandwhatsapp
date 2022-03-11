import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Shared extends StatefulWidget {
  const Shared({Key? key}) : super(key: key);

  @override
  _SharedState createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            onChanged: (value) {},
            controller: searchController,
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
          // ElevatedButton(
          //   onPressed: () async {
          //     try {
          //       await SocialShare.checkInstalledAppsForShare().then((data) {
          //         SocialShare.shareTelegram("hadsud");
          //       });
          //     } catch (e) {
          //       print("{eororo$e}");
          //     }
          //   },
          //   child: Text("Share"),
          // ),
          ElevatedButton(
            onPressed: () async {
              var whatsappUrl =
                  "https://play.google.com/store/apps/details?id=org.telegram.messenger";

              await canLaunch(whatsappUrl) != null
                  ? launch(whatsappUrl)
                  : print(
                      " Not installed",
                    );
            },
            child: const Text("Share"),
          ),
        ],
      ),
    );
  }
}
