import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../main.dart';
import '../util/utils.dart';
import 'base.dart';

class HomeContainerA extends StatelessWidget {
  const HomeContainerA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          InkWell(
            onTap: () {
              debugPrint("Tapped!");
              showMenu(context: context, position: const RelativeRect.fromLTRB(200, 0, 0, 0), items: [
                buildPopupMenuItem(Icons.image, "Background", Colors.blue[300]!, () {
                  showMenu(context: context, position: const RelativeRect.fromLTRB(2, 2, 2, 2), items: [
                    const PopupMenuItem(child: Text("ANT")),
                  ]);
                }),
                buildPopupMenuItem(Icons.message_rounded, "Send Feedback", Colors.blue[800]!, () => launch(context, '/browser', "http://google.com")),
                buildPopupMenuItem(Icons.share_rounded, "Share Application", Colors.green, () => Share.share("text", subject: "Share App")),
                buildPopupMenuItem(CupertinoIcons.xmark_circle, "Close Application", Colors.red, () => SystemNavigator.pop()),
              ]);
            },
            child: Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
              child: const Icon(Icons.more_vert_rounded),
            ),
          )
        ]),
        Center(
          child: DateBuilder(
            builder: (String dateTime) {
              return Text("$dateTime, INDIA", style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: Center(child: Text("29.6 C", style: GoogleFonts.abel(textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white)))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 7, bottom: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(onTap: () => toast("Refresh"), child: const Icon(Icons.refresh_rounded, color: Colors.white, size: 28)),
            Row(children: const [
              SizedBox(width: 40),
              Center(child: Text("Overcast", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white))),
            ]),
            InkWell(
              onTap: () => launch(context, '/shop'),
              child: Row(children: const [
                Text("More", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                SizedBox(width: 2),
                Icon(Icons.cloud_download_rounded, color: Colors.white),
              ]),
            )
          ]),
        ),
      ]),
    );
  }

  PopupMenuItem<dynamic> buildPopupMenuItem(IconData iconData, String text, Color color, Function() action) {
    return PopupMenuItem(
      onTap: action,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(iconData, color: color),
        const Padding(
          padding: EdgeInsets.only(right: 10),
        ),
        Text(text),
      ]),
    );
  }
}
