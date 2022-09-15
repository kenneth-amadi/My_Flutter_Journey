import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/typedefs.dart';
import '../model/browser_tab_model.dart';

class BrowserTab extends StatelessWidget {
  final List<BrowserTabModel> tabs;
  final int index;
  final TabClickCallback onTabClicked;
  final TabCloseCallback onTabClosed;

  const BrowserTab({Key? key, required this.tabs, required this.index, required this.onTabClicked, required this.onTabClosed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 3,
      shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Theme.of(context).primaryColor), borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child: Stack(children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: InkWell(
                    onTap: () => onTabClicked(tabs[index]),
                    child: Image.asset(
                      "assets/images/image_maps.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 28,
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
                  child: tabs[index].favicon,
                ),
                IconButton(
                  onPressed: () => onTabClosed(tabs[index]),
                  icon: const Icon(CupertinoIcons.xmark_circle),
                  enableFeedback: true,
                  iconSize: 28,
                  color: Colors.red,
                  alignment: const AlignmentDirectional(3, -3),
                ),
              ]),
            ]),
          ),
          Container(
            height: 30,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.grey),
            child: Center(
              child: Text(
                tabs[index].title,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
