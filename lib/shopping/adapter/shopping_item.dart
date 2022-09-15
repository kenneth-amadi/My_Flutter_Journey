import 'package:flutter/material.dart';

import '../../shopping/model/menu_item.dart' as menu;
import '../../util/typedefs.dart';
import '../../util/utils.dart';

class ShoppingItem extends StatelessWidget {
  final int index;
  final List<menu.MenuItem> list;
  final MenuCallback onMenuClicked;

  const ShoppingItem({Key? key, required this.list, required this.index, required this.onMenuClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[100],
      shape: shapedBorder(10),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: InkWell(
        splashColor: Colors.white,
        onTap: () => onMenuClicked(list[index]),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [list[index].icon, const Padding(padding: EdgeInsets.only(right: 16)), Text(list[index].title)]),
        ),
      ),
    );
  }
}
