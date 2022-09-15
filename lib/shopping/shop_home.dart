// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../util/utils.dart';
import 'adapter/shopping_item.dart';
import 'data/list.dart';

class ShopHome extends StatefulWidget {
  const ShopHome({Key? key}) : super(key: key);

  @override
  _ShopHomeState createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
  late String title;

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
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      title = "Shop Home";
    } else {
      title = "Shop Home (Landscape)";
    }
    return WillPopScope(
      onWillPop: () async {
        toast("Back pressed!");
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text(title), leading: const Icon(Icons.add_chart_outlined), actions: [
          PopupMenuButton(itemBuilder: (context) {
            return list.map((e) {
              return PopupMenuItem(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    e.icon,
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                    ),
                    Text(e.title),
                  ]),
                ),
              );
            }).toList();
          })
        ]),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: double.infinity,
                height: 100,
                transform: Matrix4.rotationZ(0.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                ),
                child: InkWell(
                  onTap: () => displayDialog(context),
                  child: const Center(child: Text("QWERTY")),
                ),
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return constraints.maxWidth < 500
                  ? ListView.builder(
                      itemCount: list.length,
                      itemExtent: 80,
                      itemBuilder: (BuildContext context, int index) {
                        return ShoppingItem(
                          list: list,
                          index: index,
                          onMenuClicked: (item) {
                            context.push('/hm');
                            toast(item.title);
                            /*setState(() {
                              list.remove(item);
                            });*/
                          },
                        );
                      },
                    )
                  : GridView.builder(
                      itemCount: list.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 0, crossAxisSpacing: 5, mainAxisExtent: 80),
                      itemBuilder: (context, index) {
                        return ShoppingItem(
                          list: list,
                          index: index,
                          onMenuClicked: (item) {
                            toast(item.title);
                          },
                        );
                      },
                    );
            }),
          )
        ]),
      ),
    );
  }
}
