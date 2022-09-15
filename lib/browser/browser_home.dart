// ignore_for_file: library_private_types_in_public_api
import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

import '../data/model/shop_model.dart';
import '../util/utils.dart';
import '../widget/base.dart';
import '../widget/home_container.dart';
import 'adapter/browser_tab.dart';
import 'data/list.dart';

class BrowserHome extends StatefulWidget {
  const BrowserHome({Key? key}) : super(key: key);

  @override
  _BrowserHomeState createState() => _BrowserHomeState();
}

class _BrowserHomeState extends State<BrowserHome> {
  bool _b = false;
  bool _isDismissed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, elevation: 0),
      body: ListView(children: <Widget>[
        const HomeContainerA(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: Column(children: [
            Center(child: Text("Browser History", style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue[900]))),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(double.infinity, 20)), shape: MaterialStateProperty.all(shapedBorder(25))),
                onPressed: () {},
                child: Text("DELETE ALL", style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
              ),
              ElevatedButton(
                style: ButtonStyle(shape: MaterialStateProperty.all(shapedBorder(25))),
                onPressed: () {
                  //toast("msg");
                  fileTask();
                },
                child: InkWell(onTap: () => printJson(), child: Text("OPEN", style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white))),
              ),
              Text("Save History", style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.blue[900])),
              Switch(value: _b, onChanged: (switchCallback))
            ]),
          ]),
          /*InkWell(
            onTap: () async {
              var n = await displayDialog(context);
              toast(n!);
            },
            child: const Center(child: Text("QWERTY")),
          ),*/
        ),
        _isDismissed
            ? Dismissible(
                onUpdate: (details) => toast(details.progress.toString()),
                onDismissed: (direction) => _isDismissed = true,
                background: Container(color: Colors.amberAccent),
                secondaryBackground: Container(color: Colors.white10),
                dragStartBehavior: DragStartBehavior.down,
                dismissThresholds: const <DismissDirection, double>{DismissDirection.startToEnd: 0.99, DismissDirection.endToStart: 0.99},
                key: const Key("Swipe"),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: InkWell(onTap: () => displayDialog(context), child: const Center(child: Text("QWERTY"))),
                ),
              )
            : const Text("data"),
        Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: InkWell(
            onTap: () => displayDialog(context),
            child: const Center(child: Text("QWERTY")),
          ),
        ),
        Container(
          height: 170,
          margin: const EdgeInsets.all(5),
          child: LayoutBuilder(builder: (context, constraints) {
            return TabListView(constraints, tabs, (tabCallback));
          }),
        ),
        Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          child: InkWell(
            onTap: () => displayDialog(context),
            child: const Center(child: Text("QWERTY")),
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.lightBlue,
          ),
          child: InkWell(
            onTap: () => displayDialog(context),
            child: const Center(child: Text("QWERTY")),
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.purpleAccent,
          ),
          child: InkWell(
            onTap: () => displayDialog(context),
            child: const Center(child: Text("QWERTY")),
          ),
        )
      ]),
    );
  }

  void fileTask() async {
    var filename = "data.json";
    Directory? directory = await getExternalStorageDirectory();
    File file = File("${directory?.path}/$filename");
    String json = await rootBundle.loadString("assets/data.json");
    await file.writeAsString(json);
  }

  Widget tabCallback(BuildContext context, int index) {
    return BrowserTab(
      tabs: tabs,
      index: index,
      onTabClicked: (item) {
        toast(item.title);
      },
      onTabClosed: (item) {
        setState(() {
          tabs.remove(item);
        });
      },
    );
  }

  void switchCallback(bool value) => setState(() {
        _b = value;
        _isDismissed = value;
      });

  printJson() async {
    String json = await rootBundle.loadString("assets/data.json");
    Map<String, dynamic> jsonMap = await jsonDecode(json);
    ShopModel shop = ShopModel.fromJson(jsonMap);

    log(shop.customers[2].name.toString());
  }
}
