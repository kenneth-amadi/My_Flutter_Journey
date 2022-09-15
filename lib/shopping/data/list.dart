import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/menu_item.dart' as menu;

List<menu.MenuItem> list = [
  menu.MenuItem("About", const Icon(CupertinoIcons.app_badge, color: Colors.deepPurple)),
  menu.MenuItem("Settings", const Icon(CupertinoIcons.settings, color: Colors.deepPurple)),
  menu.MenuItem("Contact", const Icon(CupertinoIcons.phone, color: Colors.deepPurple)),
  menu.MenuItem("FAQ", const Icon(CupertinoIcons.question, color: Colors.deepPurple)),
  menu.MenuItem("Help", const Icon(CupertinoIcons.hand_point_right, color: Colors.deepPurple)),
  menu.MenuItem("About", const Icon(CupertinoIcons.app_badge, color: Colors.deepPurple)),
  menu.MenuItem("Settings", const Icon(CupertinoIcons.settings, color: Colors.deepPurple)),
];
