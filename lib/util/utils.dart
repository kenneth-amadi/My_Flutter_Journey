import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toast(String msg) =>
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.black54, textColor: CupertinoColors.white, fontSize: 18);

log(String msg) => debugPrint(msg);

RoundedRectangleBorder shapedBorder(double radius) => RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: const BorderSide(width: 1, color: Colors.white),
    );

Future<String?> displayDialog(BuildContext context) => showDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text("Dialog"),
          content: const Text("Data"),
          actions: [
            TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                ),
                onPressed: () => Navigator.pop(context, "YES NOW!"),
                child: const Text("Click me")),
          ],
        ));
